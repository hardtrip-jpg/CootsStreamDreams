extends Control

var toggled := false

func _ready() -> void:
	BgMusicTest.menu_music()

func _on_Regular_pressed() -> void:
	Global.is_regular = true
	SceneTransition.change_scene("res://uiscenes/InbetweenSTART.tscn", "dissolve")


func _on_Endless_pressed() -> void:
	Global.is_regular = false
	SceneTransition.change_scene("res://uiscenes/InbetweenSTART.tscn", "dissolve")


func _on_Button_pressed() -> void:
	if toggled:
		var settings = get_node("SettingsMenu")
		settings.queue_free()
		toggled = false
	else:
		var SettingsMenu = preload("res://uiscenes/SettingsMenu.tscn").instance()
		add_child(SettingsMenu)
		toggled = true
