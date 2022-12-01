import time
from turtle import Screen
from player import Player
from car_manager import CarManager
from scoreboard import Scoreboard

screen = Screen()
screen.setup(width=600, height=600)
screen.bgcolor('white')
screen.tracer(0)

p1 = Player()
score = Scoreboard()

car_manager = CarManager()

screen.listen()
screen.onkey(p1.move_up, "Up")

game_is_on = True
while game_is_on:
    time.sleep(0.1)
    screen.update()

    car_manager.create_car()
    car_manager.move_car()

    for car in car_manager.all_cars:
        if car.distance(p1) < 20:
            score.game_over()
            game_is_on = False


    p1.move_up()

    if p1.verify_finish():
        score.score += 1
        score.update_score()
        car_manager.level_up()


screen.exitonclick()