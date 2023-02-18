extends Node

var health := 4
var remaining_health := health

var default_speed := 1
var current_speed := default_speed

var level_amount := 1

var chess_games := [
	"res://microgames/Chess/DEFChess.tscn"
	]

var treat_games := [
	"res://microgames/Treat/DEFTreat.tscn"
]

var amongus_games := [
	"res://microgames/AmongUs/DEFAmongUs.tscn"
]

var all_game_levels := [
	chess_games,
	amongus_games,
	treat_games
	]
	
var current_game_levels : Array = all_game_levels.duplicate()

var current_array_size : int
var next_level_key : int
var current_game : Array
var pick_level : int


func _ready() -> void:
	randomize()

func _next_level() -> String:
	if current_game_levels.size() <= 0:
		current_game_levels = all_game_levels.duplicate()
	current_array_size = current_game_levels.size()
	next_level_key = randi() % current_array_size
	current_game = current_game_levels[next_level_key]
	pick_level = randi() % current_game.size()
	var now_level : String = current_game[pick_level]
	current_game_levels.remove(next_level_key)
	return now_level
