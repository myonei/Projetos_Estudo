from turtle import Screen, Turtle
from paddle import Paddle
from ball import Ball
from scoreboard import Scoreboard
import time

screen = Screen()
screen.bgcolor('black')
screen.setup(width=800, height=600)
screen.tracer(0)


p1 = Paddle((-350, 0))
p2 = Paddle((350, 0))
ball = Ball()
scoreboard = Scoreboard()


screen.listen()
#p1
screen.onkey(p1.go_up, 'w')
screen.onkey(p1.go_down, 's')

#p2
screen.onkey(p2.go_up, 'Up')
screen.onkey(p2.go_down, 'Down')

game_on = True

while game_on:
    time.sleep(0.1)
    ball.move()
    screen.update()

    #colisão com parede
    if ball.ycor() > 280 or ball.ycor() < -280:
        ball.bounce_y()

    #colisão com paddle
    pos_ball = ball.position()
    if (p1.distance(pos_ball) < 30 and ball.xcor() < 300) or (p2.distance(pos_ball) < 30 and ball.xcor() > -300):
        ball.bounce_x()

    if ball.xcor() > 400:
        scoreboard.p1_score += 1
        scoreboard.update_score()
        ball.resetposition()

    elif ball.xcor() < -400:
        scoreboard.p2_score += 1
        scoreboard.update_score()
        ball.resetposition()



screen.exitonclick()
