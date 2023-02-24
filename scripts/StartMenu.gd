extends Control

func _ready() -> void:
	BgMusicTest.menu_music()

func _on_Regular_pressed() -> void:
	Global.is_regular = true
	SceneTransition.change_scene("res://uiscenes/InbetweenSTART.tscn", "dissolve")


func _on_Endless_pressed() -> void:
	Global.is_regular = false
	SceneTransition.change_scene("res://uiscenes/InbetweenSTART.tscn", "dissolve")
