extends Control

func _ready() -> void:
	BgMusicTest.menu_music()

func _on_Regular_pressed() -> void:
	SceneTransition.change_scene("res://uiscenes/Inbetween.tscn", "dissolve")


func _on_Endless_pressed() -> void:
	SceneTransition.change_scene("res://uiscenes/Inbetween.tscn", "dissolve")
