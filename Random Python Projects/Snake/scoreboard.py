from turtle import Turtle


class Scoreboard(Turtle):

    def __init__(self):
        super().__init__()
        with open('high_score.text') as file:
            self.high_score = int(file.read())
        self.score = 0
        self.pu()
        self.setpos(0, 275)
        self.color('white')
        self.ht()
        self.escreve_ponto()

    def escreve_ponto(self):
        self.clear()
        self.write(f'Score: {self.score}  High score: {self.high_score}', align='center', font=('Times New Roman', 15, 'normal'))

    def reset(self):
        if self.score > self.high_score:
            self.high_score = self.score
            with open('high_score.text', mode='w') as h_score:
                h_score.write(str(self.high_score))
        self.score = 0
        self.escreve_ponto()

    def aumenta_ponto(self):
        self.score += 1
