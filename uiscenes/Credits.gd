extends Node2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://textures/bossfight/hand.png"))
	
func _go_out() -> void:
	Input.set_custom_mouse_cursor(null)
	SceneTransition.change_scene("res://uiscenes/StartMenu.tscn", "dissolve")
