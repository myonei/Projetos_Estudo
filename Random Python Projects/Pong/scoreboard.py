from turtle import Turtle


class Scoreboard(Turtle):

    def __init__(self):
        super().__init__()
        self.pu()
        self.color('white')
        self.hideturtle()
        self.p1_score = 0
        self.p2_score = 0
        self.update_score()

    def update_score(self):
        self.clear()
        self.goto(-100, 200)
        self.write(self.p1_score, align='center', font=('Comic Sans', 60, 'normal'))
        self.goto(100, 200)
        self.write(self.p2_score, align='center', font=('Comic Sans', 60, 'normal'))



