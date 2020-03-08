import os

os.environ["PYGAME_HIDE_SUPPORT_PROMPT"] = "hide"

import pygame

screen = font = None
bounds = 125, 150
resolution = 1000, 1000
screen = pygame.display.set_mode(resolution)
pygame.font.init()

font = pygame.font.SysFont("roboto", 50)
screen.fill((0, 0, 0))


def init(title):
    pygame.init()
    pygame.display.set_caption(title)


def render_map(container):
    for x in container.objects:
        render_unit(x.to_render(bounds[1], bounds[0]))
    # time.sleep(0.1)
    pygame.display.update()


def render_unit(data):
    x_pos,  y_pos, width, height,  color = data
    pygame.draw.rect(screen, color, (y_pos, x_pos, height, width))


def render_text(a, b):
    text = f"Nodes expanded: {a}"
    text_image = font.render(text, True, (0, 128, 0))
    screen.blit(text_image, (resolution[0]/2-font.size(text)[0]/2, 10))
    text = f"Path length: {b}"
    text_image = font.render(text, True, (0, 128, 0))
    screen.blit(text_image, (resolution[0]/2-font.size(text)[0]/2, 50))
    pygame.display.update()
