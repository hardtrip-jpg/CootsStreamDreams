extends Node2D

onready var health_label := $Health
onready var current_label := $Current
onready var status_label := $Status


var game_size := Global.all_game_levels.size()
var current_game_levels := Global.all_game_levels

func _ready() -> void:
	health_label.text = str(Global.remaining_health)
	current_label.text = str(Global.level_amount)
	if Global.remaining_health <= 0:
		status_label.text = "Dead"
	else:
		status_label.text = "Alive"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		Global.level_amount += 1
		SceneTransition.change_scene("res://microgames/Chess/DEFChessGame.tscn","dissolve")
