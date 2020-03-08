import heapq

from algo.search import Search
from structures.map import Map
#from algo.euclid import euclid as heuristic
from algo.manhattan import manhattan as heuristic


class Greedy(Search):
    def __init__(self, graph):
        super().__init__(graph)

    def search(self, display):

        open_nodes = []
        closed_nodes = []
        found = False

        dest = self.map.dest_node
        src = self.map.src_node
        dest.key = float(0)
        src.key = heuristic(src, dest)
        open_total = 0
        src.set_state("src")
        dest.set_state("dest")

        heapq.heappush(open_nodes, src)

        while open_nodes and not found:
            mini = heapq.heappop(open_nodes)
            if mini == dest:
                break

            neighbours = self.get_neighbours(mini)
            for neighbour in neighbours:
                if neighbour.state in ["fresh", "dest"]:
                    neighbour.set_state("open")
                    neighbour.key = heuristic(neighbour, dest)
                    neighbour.parent = mini
                    heapq.heappush(open_nodes, neighbour)
                    open_total += 1

            mini.set_state("closed")
            display(self.map)

        path = self.retrace(self.map.dest_node, self.map.src_node)
        self.map.src_node.set_state("src")
        display(self.map)


        return open_total, path


if __name__ == "__main__":
    a = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    rs = Greedy(a)
    rs.search(Greedy(rs))
