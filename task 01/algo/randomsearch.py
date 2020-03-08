import random
from algo.search import Search
from structures.map import Map


class RandomSearch(Search):
    def __init__(self, graph):
        super().__init__(graph)

    def search(self, display):
        actual = self.map.src_node
        target = self.map.dest_node

        open_total = 1
        open_nodes = [actual]
        found = False

        display(self.map)
        # path build
        while actual != target and not found:
            self.map.src_node.set_state("src")
            neighbours = self.get_neighbours(actual)

            for neighbour in neighbours:
                if neighbour.state == "fresh" or neighbour.state == "dest":
                    neighbour.parent = actual
                    neighbour.set_state("open")  # sets fresh neighbour node as open
                    open_nodes.append(neighbour)
                    open_total += 1

                    if neighbour == target:
                        found = True

            actual.set_state("closed")  # remove actual from open list and close it
            open_nodes.remove(actual)
            display(self.map)

            if found:
                break

            actual = random.choice(open_nodes)

        display(self.map)
        path = self.retrace(self.map.dest_node, self.map.src_node)
        display(self.map)
        return open_total, path


if __name__ == "__main__":
    a = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    rs = RandomSearch(a)
    rs.search(super.test_display(rs))
