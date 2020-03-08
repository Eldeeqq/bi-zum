from _collections import deque
from algo.search import Search
from structures.map import Map


class BFS(Search):
    def __init__(self, graph):
        super().__init__(graph)

    def search(self, display):
        lifo = deque()
        target = self.map.dest_node

        open_total = 0
        lifo.appendleft(self.map.src_node)
        self.map.src_node.set_state("src")
        found = False

        display(self.map)
        # path build
        found = False
        while lifo and not found:
            self.map.src_node.set_state("src")
            actual = lifo.pop()
            neighbours = self.get_neighbours(actual)

            for neighbour in neighbours:
                if neighbour.state == "fresh" or neighbour.state == "dest":
                    neighbour.parent = actual
                    neighbour.set_state("open")  # sets fresh neighbour node as open
                    lifo.appendleft(neighbour)
                    open_total += 1

                    if neighbour == target:
                        lifo.clear()
                        found = True

            actual.set_state("closed")  # remove actual from open list and close it
            display(self.map)

        display(self.map)
        path = self.retrace(self.map.dest_node, self.map.src_node)
        self.map.src_node.set_state("src")
        display(self.map)
        return open_total, path


if __name__ == "__main__":
    a = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    rs = BFS(a)
    rs.search(BFS(rs))
