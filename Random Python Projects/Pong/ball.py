from turtle import Turtle

class Ball(Turtle):

    def __init__(self):
        super().__init__()
        self.pu()
        self.shape('circle')
        self.color('white')
        self.ymove = 10
        self.xmove = 10

    def bounce_y(self):
        self.ymove *= -1

    def bounce_x(self):
        self.xmove *= -1

    def move(self):
        x = self.xcor() + self.xmove
        y = self.ycor() + self.ymove
        self.goto(x, y)

    def resetposition(self):
        self.setposition(0, 0)
        self.bounce_x()

