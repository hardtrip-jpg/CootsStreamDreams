extends Node2D

func _ready() -> void:
	BgMusicTest.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		SceneTransition.change_scene("res://uiscenes/StartMenu.tscn", "dissolve")
