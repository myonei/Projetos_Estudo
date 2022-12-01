from turtle import Turtle

STARTING_POSITION = (0, -280)
MOVE_DISTANCE = 10
FINISH_LINE_Y = 280


class Player(Turtle):

    def __init__(self):
        super().__init__()
        self.shape('turtle')
        self.color('Black')
        self.pu()
        self.start_pos()
        self.setheading(90)

    def move_up(self):
        new_y = self.ycor() + MOVE_DISTANCE
        self.goto(self.xcor(), new_y)

    def start_pos(self):
        self.setpos(STARTING_POSITION)

    def verify_finish(self):
        if self.ycor() > FINISH_LINE_Y:
            self.start_pos()
            return True
        return False


