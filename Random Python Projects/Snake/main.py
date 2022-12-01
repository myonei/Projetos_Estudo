import time
from turtle import Screen
from snake import Snake
from food import Food
from scoreboard import Scoreboard

screen = Screen()
screen.setup(width=600, height=600)
screen.bgcolor('black')
screen.title("Kobra")
screen.tracer(0)

food = Food()
cobra = Snake()
pontos = Scoreboard()

game_on = True

screen.listen()
screen.onkey(key='Up', fun=cobra.norte)
screen.onkey(key='Down', fun=cobra.sul)
screen.onkey(key='Right', fun=cobra.leste)
screen.onkey(key='Left', fun=cobra.oeste)


while game_on:

    # movimento
    screen.update()
    time.sleep(0.1)
    cobra.move()

    # colisão com comida
    if cobra.head.distance(food) < 15:
        food.food_position()
        pontos.aumenta_ponto()
        pontos.escreve_ponto()
        cobra.cresce(cobra.segmentos[-1].position())

    # colisão com parede
    if cobra.head.xcor() > 290 or cobra.head.xcor() < -290 or cobra.head.ycor() > 290 or cobra.head.ycor() < -290:
        pontos.reset()
        cobra.reset()

    # colisão com rabo
    for parte in cobra.segmentos[1:]:
        if cobra.head.distance(parte)<10:
            pontos.reset()
            cobra.reset()

screen.exitonclick()
