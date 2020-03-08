import re
from gui.window import resolution, bounds
from structures.unit import Unit
import math

class Map:
    def add_unit(self, unit):
        self.grid[unit.y][unit.x] = unit
        self.objects.append(unit)
        if unit.y not in self.direct:
            self.direct.update({unit.y: {unit.x: unit}})
        else:
            self.direct[unit.y].update({unit.x: unit})

    def __init__(self, file):
        # try:
        with open(file, "r") as f:
            lines = f.readlines()
        self.objects = []

        self.src = [int(x) for x in re.sub("[^0-9,]*", "", lines[-2]).split(",")]
        self.dest = [int(x) for x in re.sub("[^0-9,]*", "", lines[-1]).split(",")]

        lines = lines[:-2]
        self.height = len(lines)
        self.width = len(lines[0]) - 1

        self.grid = [[None for x in range(self.width)] for y in range(self.height)]
        self.direct = {}
        # print(self.height, self.width)
        for y in range(self.height):
            for x in range(self.width):
                # print(x,y)
                unit = Unit(y, x)
                #unit = Unit(x, y)

                if lines[y][x] is "X":
                    unit.is_wall = True

                self.add_unit(unit)
        a = round((resolution[0]-2*bounds[0])/self.width)
        b = round((resolution[1]-2*bounds[1])/self.height)

        Unit.scale = min(max(1, min(a, b)), 50)
        self.src_node = self.get(self.src[1], self.src[0])
        self.src_node.set_state("src")
        self.dest_node = self.get(self.dest[1], self.dest[0])
        self.dest_node.set_state("dest")

    # except BaseException:
    #     raise Exception("Map couldnt be loaded")

    def print(self):
        for y in range(self.height):
            for x in range(self.width):
                print(self.grid[y][x].get_char_representation(), end="")
            print("\n", end="")
        print(f"Dim: {self.height} x {self.width}")

    def render(self, render_unit):
        for y in range(self.height):
            for x in range(self.width):
                render_unit(self.grid[y][x].to_render())

    def check(self, y, x):
        print(f"Unit at {y}:{x} is {self.direct[y][x]}")

    def get(self, y, x):
        if y not in self.direct or x not in self.direct[y]:
            raise AttributeError("Out of bounds")
        return self.direct[y][x]


if __name__ == "__main__":
    m = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    m.print()
    m.check(4, 4)
