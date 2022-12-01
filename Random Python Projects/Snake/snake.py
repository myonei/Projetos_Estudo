from turtle import Turtle, Screen

STARTING_POSITION = [(0, 0), (-20, 0), (-40, 0)]
MOVE_DISTANCE = 20
screen = Screen()

class Snake:
    def __init__(self):
        self.segmentos = []
        self.start()
        self.head = self.segmentos[0]

    def start(self):
        for x in range(0, 3):
            self.cresce(STARTING_POSITION[x])

    def norte(self):
        if not self.head.heading() == 270:
            self.head.setheading(90)

    def leste(self):
        if not self.head.heading() == 180:
            self.head.setheading(0)

    def oeste(self):
        if not self.head.heading() == 0:
            self.head.setheading(180)

    def sul(self):
        if not self.head.heading() == 90:
            self.head.setheading(270)

    def cresce(self, pos):
        nova_cobra = Turtle(shape='square')
        nova_cobra.color('white')
        nova_cobra.pu()
        nova_cobra.setpos(pos)
        self.segmentos.append(nova_cobra)

    def move(self):

        for i in range(len(self.segmentos) - 1, 0, -1):
            self.segmentos[i].setpos(self.segmentos[i - 1].pos())
        self.head.fd(MOVE_DISTANCE)

    def reset(self):
        for seg in self.segmentos:
            seg.goto(1000, 1000)
        self.segmentos.clear()
        self.start()
        self.head = self.segmentos[0]



