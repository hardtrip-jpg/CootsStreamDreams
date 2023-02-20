extends Node

var health := 4
var remaining_health := health
var previous_health := remaining_health

var default_speed := 1.0
var current_speed := default_speed
var default_add_speed := .15
var add_speed := default_add_speed


var level_amount := 0
var speed_level_amount := 0

var animation_speed := .9

var chess_games := [
	"res://microgames/Chess/DEFChess.tscn"
	]

var treat_games := [
	"res://microgames/TestTimingGame.tscn"
]

var amongus_games := [
	"res://microgames/TestAmountGame.tscn"
]

var all_game_levels := [
	chess_games
	]
	
var current_game_levels : Array = all_game_levels.duplicate()


func _ready() -> void:
	randomize()

func _next_level() -> String:
	if current_game_levels.size() <= 0:
		current_game_levels = all_game_levels.duplicate()
	var current_array_size = current_game_levels.size()
	var next_level_key = randi() % current_array_size
	var current_game = current_game_levels[next_level_key]
	var pick_level = randi() % current_game.size()
	var now_level : String = current_game[pick_level]
	current_game_levels.remove(next_level_key)
	return now_level

func speed_up():
	current_speed += add_speed
	speed_level_amount = 0
	if animation_speed <= 0.1:
		animation_speed = 0.2
	else:
		animation_speed -= .05
	if add_speed <= 0:
		add_speed = .10
	else:
		add_speed -= 0.02
	print("Speed Up: " + str(current_speed))
