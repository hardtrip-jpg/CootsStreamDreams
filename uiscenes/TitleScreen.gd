extends Node2D

func _ready() -> void:
	BgMusicTest.title_music()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		SceneTransition.change_scene("res://uiscenes/IntroSlides.tscn", "dissolve")
