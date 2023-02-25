extends Node2D

onready var animation := $AnimationPlayer

var step_amount = 1

func _ready() -> void:
	BgMusicTest.menu_music()
	animation.play("step" + str(step_amount))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		step_amount += 1
		animation.play("step" + str(step_amount))

func title_screen() -> void:
	SceneTransition.change_scene("res://uiscenes/StartMenu.tscn","dissolve")
