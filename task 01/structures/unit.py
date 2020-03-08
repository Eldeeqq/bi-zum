states = ["fresh", "open", "closed", "src", "dest", "actual", "path"]

colors = {
    "fresh": (255, 255, 255),  # white
    "open": (115, 145, 34),  # green
    "closed": (208, 130, 85),  # orange
    "src": (128, 0, 128),  # purple
    "dest": (126, 164, 179),  # blue
    "actual": (255, 255, 0),  # yellow
    "path": (255, 232, 124),  # gray
}

chars = {
    "fresh": " ",
    "open": ".",
    "closed": "-",
    "src": "O",
    "dest": "@",
    "actual": "?",
    "path": "o",
}


class Unit:
    scale = 10

    def __init__(self, y, x, wall=False):
        self.x = x
        self.y = y
        self.is_wall = wall
        self.state = "fresh" if not wall else "closed"
        self.parent = None
        self.key = 0
        self.distance = 0

    def get_pos(self, y_off=200, x_off=100):
        return (
            (self.y - 1) * self.scale + y_off,
            (self.x - 1) * self.scale + x_off,
            self.scale,
            self.scale,
        )

    def to_render(self, y_off=100, x_off=100):
        return (
            (self.y - 1) * self.scale + y_off,
            (self.x - 1) * self.scale + x_off,
            self.scale,
            self.scale,
            colors[self.state] if not self.is_wall else (203, 65, 84),
        )

    def is_fresh(self):
        return (
            not self.is_wall
            and self.state in ["fresh", "dest"]
            and self.state not in ["closed", "src"]
        )

    def get_state(self):
        if self.is_wall:
            return 0, 0, 0
        else:
            return colors[self.state]

    def set_state(self, state):
        if state not in states:
            raise AttributeError(f"{state} not defined")
        self.state = state

    def get_char_representation(self):
        if self.is_wall:
            return "#"
        return chars[self.state]

    def __repr__(self):
        return str(self.key)

    def __eq__(self, other):
        return self.y == other.y and self.x == other.x

    def __gt__(self, other):
        return self.key > other.key

    def __lt__(self, other):
        return self.key < other.key

    def __str__(self):
        return self.key
