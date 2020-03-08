from time import sleep


class Search:
    def __init__(self, map):
        self.map = map

    def search(self, display):
        pass

    def test_display(search):
        def _display():
            search.map.render(lambda x: print(x.get_char_representation(), end=""))
            sleep(0.1)

        return _display

    def retrace(self, dest, src):
        rec = [dest]
        while dest != src:
            dest = dest.parent
            dest.set_state("path")
            rec.insert(0, dest)

        self.map.dest_node.set_state("dest")
        self.map.src_node.set_state("src")

        return len(rec)-1

    def get_neighbours(self, unit):
        neighbours = []
        y, x = unit.y, unit.x
        for pos in [(y - 1, x), (y, x + 1), (y + 1, x), (y, x - 1)]:
            try:
                item = self.map.get(*pos)
                if not item.is_wall:
                    neighbours.append(item)
            except AttributeError:
                pass
        return neighbours
