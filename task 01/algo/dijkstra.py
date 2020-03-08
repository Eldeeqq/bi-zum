import heapq

from algo.search import Search
from structures.map import Map


class Dijkstra(Search):
    def __init__(self, graph):
        super().__init__(graph)

    def search(self, display):
        for neighbour in self.map.objects:
            neighbour.set_state("fresh")
            neighbour.key = float("inf")

        open_total = 0
        src = self.map.src_node
        src.key = float(0)

        dest = self.map.dest_node

        src.set_state("src")
        dest.set_state("dest")

        pq = [src]

        found = False
        while pq and not found:
            src.set_state("src")
            mini = heapq.heappop(pq)
            neighbours = self.get_neighbours(mini)

            for neighbour in neighbours:
                if neighbour.state in ["fresh", "dest"]:
                    open_total += 1

                # relaxace
                if neighbour.key > mini.key + 1:
                    if neighbour.state is not "open":
                        heapq.heappush(pq, neighbour)
                        neighbour.set_state("open")
                    neighbour.key = mini.key + 1
                    neighbour.parent = mini

                if neighbour == dest:
                    found = True

            mini.set_state("closed")
            display(self.map)

        path = self.retrace(self.map.dest_node, self.map.src_node)
        self.map.src_node.set_state("src")
        display(self.map)
        return open_total, path


if __name__ == "__main__":
    a = Map("/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt")
    rs = Dijkstra(a)
    rs.search(Dijkstra(rs))
