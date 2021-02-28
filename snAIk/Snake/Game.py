import math
import random
from typing import Any, Callable

import numpy as np


def compare(a, b):
    if a == b:
        return 0
    return -1 if a > b else 1


def distance(src, des):
    return abs(src[0] - des[0]) + abs(src[1] - des[1])


def is_on(a, b, c):
    "Return true iff point c intersects the line segment from a to b."
    # (or the degenerate case that all 3 points are coincident)
    return collinear(a, b, c) and (
        within(a[1], c[1], b[1]) if a[1] != b[1] else within(a[0], c[0], b[0])
    )


def collinear(a, b, c):
    "Return true iff a, b, and c all lie on the same line."
    return (b[1] - a[1]) * (c[0] - a[0]) == (c[1] - a[1]) * (b[0] - a[0])


def within(p, q, r):
    "Return true iff q is between p and r (inclusive)."
    return p <= q <= r or r <= q <= p


class Game:
    class Unit:
        def __init__(self, y, x, _type=0):  # blank
            self.y, self.x = y, x
            self.type = _type

        def __call__(self, *args, **kwargs):
            return self.y, self.x

    def __init__(self, h, w):
        self.bad_steps = 0
        self.h, self.w = h, w
        self._map = []
        self.snake = []
        self.apple = []
        self.score = 0
        self.steps = 0
        self.eaten = 0
        self.status = ""
        self.direction = None
        self.reset()

    def at(self, y, x) -> Unit:
        return self._map[y][x]

    def add_snake(self):
        self.snake.append(
            self.at(
                *random.choice(
                    [
                        (y, x)
                        for y in range(self.h)
                        for x in range(self.w)
                        if self.at(y, x).type is 0  # blank
                    ]
                )
            )
        )
        self.snake[0].type = 2

    def add_apple(self):
        if self.apple:
            return
        possible = [
            (y, x)
            for y in range(self.h)
            for x in range(self.w)
            if self.at(y, x).type is 0
        ]  # blank
        choice = random.choice(possible)
        self.apple.append(self.at(choice[0], choice[1]))
        self.apple[0].type = 1  # apple

    def sniff(self) -> np.array:
        res = []
        head = np.array([self.snake[-1].y, self.snake[-1].x])
        apple = np.array(self.apple[0]())

        dirs = {
            0: (lambda: np.array(self.direction)),
            1: (
                lambda: np.array([self.direction[1], -self.direction[0]])
            ),  # left rotation
            2: (
                lambda: np.array([-self.direction[1], self.direction[0]])
            ),  # right rotation
        }
        # print(f"snake: {head}")
        for x in [0, 1, 2]:
            res.append(  # first block in direction
                1 if self.at(*(head + dirs[x]())).type in [0, 1] else 0
            )
            res.append(  # second block in direction
                1
                if self.bounds(*(head + np.dot(2, dirs[x]())))
                and self.at(*(head + np.dot(2, dirs[x]()))).type in [0, 1]
                else 0
            )
            res.append(  # apple is in direction
                1 if is_on(apple, head, (head + dirs[x]())) else 0
            )

        norm: Callable[[np.array], float] = lambda x: math.sqrt(
            sum([pow(xi, 2) for xi in x])
        )
        # this adds the information of the apple position
        res.append(compare(apple[0], head[0]))
        res.append(compare(apple[1], head[1]))
        # cosine similarity - higher when close, smaller when far
        res.append(np.dot(head, apple) / (np.dot(norm(head), norm(apple))))

        return np.array(res)

    @property
    def map(self):
        return np.array([[x.type for x in y] for y in self._map])

    def step(self, direction):
        if self.score <= 0:
            self.snake.clear()
            self.status = "Starved"
            return

        self.steps += 1
        self.score -= 1

        self.direction = {
            0: (lambda: np.array(self.direction)),
            1: (
                lambda: np.array([self.direction[1], -self.direction[0]])
            ),  # left rotation
            2: (
                lambda: np.array([-self.direction[1], self.direction[0]])
            ),  # right rotation
        }[direction]()

        head = self.snake[-1]
        way = self.direction
        target = self.at(head.y + way[0], head.x + way[1])
        apple = self.apple[0]
        if distance(head(), apple()) < distance(target(), apple()):
            self.bad_steps += 1

        if target.type is 1:  # apple
            target.type = 2  # snake
            self.snake.append(target)
            self.score += 200
            self.eaten += 1
            for x in self.apple:
                x.type = 2
            self.apple.clear()
            self.add_apple()
            self.bad_steps = 0

        elif target.type in [3, 2]:  # wall, snake
            for x in self.snake:
                self.at(*x()).type = 0
            self.snake.clear()
            self.status = "Hit a wall" if target.type is 3 else "Ate itself."
        else:
            target.type = 2  # snake
            self.snake.append(target)
            self.snake[0].type = 0  # blank
            self.snake.pop(0)

    def reset(self):
        self._map.clear()
        self.snake.clear()
        self.apple.clear()

        self._map = [[self.Unit(y, x) for x in range(self.w)] for y in range(self.h)]
        for y in range(self.h):
            self.at(y, 0).type = 3
            self.at(y, self.w - 1).type = 3
        for x in range(self.w):
            self.at(0, x).type = 3
            self.at(self.h - 1, x).type = 3

        self.snake = []
        self.apple = []

        self.add_snake()
        self.add_apple()

        s = self.snake[-1]
        self.direction = [(-1, 0), (0, -1), (1, 0), (0, 1)][
            np.array([s.y, s.x, self.h - s.y, self.w - s.x]).argmax()
        ]

        self.score = 200
        self.steps = 0
        self.eaten = 0
        self.bad_steps = 0
        self.status = "Alive"

    def bounds(self, y, x):
        return y < self.h and x < self.w

    @property
    def fitness(self):
        d = 2 ** self.eaten
        b = (self.h * self.w) / (
            1 + distance(self.apple[0](), self.snake[-1]())
            if self.eaten and self.snake
            else self.h * self.w
        )
        c = int(self.steps - self.bad_steps / (1 + self.bad_steps))
        return d * b * c


if __name__ == "__main__":
    g = Game(10, 10)
    print(g.map)
    print(g.sniff())
    while g.snake:
        a = int(input())
        g.step(a)
        print(g.map)
        print(g.sniff())
    # print(g.steps)
