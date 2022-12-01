from turtle import Turtle

FONT = ("Courier", 24, "bold")


class Scoreboard(Turtle):

    def __init__(self):
        super().__init__()
        self.pu()
        self.color('black')
        self.hideturtle()
        self.score = 0
        self.update_score()

    def update_score(self):
        self.clear()
        self.setpos(-280, 250)
        self.write(f'Level: {self.score}', align='left', font=FONT)

    def game_over(self):
        self.goto(0,0)
        self.write(f'GAME OVER', align='center', font=FONT)


