from structures.map import Map
from gui import window
import os


os.environ["PYGAME_HIDE_SUPPORT_PROMPT"] = "hide"

import pygame
import argparse


def search_factory(search, path):
    if search not in ["random", "bfs", "dfs", "dijkstra", "astar", "greedy"]:
        raise AttributeError(f"{search} not implemented")
    if search == "random":
        from algo.randomsearch import RandomSearch as engine

    if search == "dfs":
        from algo.dfs import DFS as engine

    if search == "bfs":
        from algo.bfs import BFS as engine

    if search == "dijkstra":
        from algo.dijkstra import Dijkstra as engine

    if search == "greedy":
        from algo.greedy import Greedy as engine

    if search == "astar":
        from algo.astar import Astar as engine

    return engine(Map(path))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Graph traversal algorithms")
    parser.add_argument(
        "-t", nargs=1, required=True, help="kind: random, dfs, bfs, dijkstra, a-star"
    )
    parser.add_argument("-m", nargs=1, required=True, help="map path")
    params = parser.parse_args()

    # path = "/home/eldee/PycharmProjects/ZUM/searches/maps/01_71_51_156.txt"
    window.init(params.t[0])
    se = search_factory(params.t[0], params.m[0])

    a, b = se.search(window.render_map)
    window.render_text(a, b)

    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
