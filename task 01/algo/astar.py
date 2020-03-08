import heapq
#from algo.euclid import euclid as heuristic
from algo.manhattan import manhattan as heuristic
from algo.search import Search
from structures.map import Map
from time import sleep


class Astar(Search):
    def __init__(self, graph):
        super().__init__(graph)

    def search(self, display):
        open_nodes = []

        src = self.map.src_node
        src.key = float(0)
        src.set_state("src")
        open_total = 0

        dest = self.map.dest_node
        dest.set_state("dest")

        heapq.heappush(open_nodes, src)
        src.distance = 0

        while open_nodes:

            mini = heapq.heappop(open_nodes)
            if mini is dest:
                break
            for neighbour in self.get_neighbours(mini):
                if neighbour.state is not "closed":

                    if neighbour.state in ["fresh", "dest"]:
                        open_total += 1

                    d = mini.distance + 1
                    if neighbour.state not in ["open", "src"] or neighbour.key < d:
                        neighbour.distance = d
                        neighbour.parent = mini

                        neighbour.key = d + heuristic(neighbour, dest)

                        if neighbour.state is "open":
                            heapq.heapify(open_nodes)


                        if neighbour.state is not "open":
                            heapq.heappush(open_nodes, neighbour)
                            neighbour.set_state("open")
            mini.set_state("closed")
            display(self.map)

        path = self.retrace(self.map.dest_node, self.map.src_node)
        self.map.src_node.set_state("src")
        display(self.map)

        return open_total, path


if __name__ == "__main__":
    a = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    rs = Astar(a)
    rs.search(Astar(rs))
