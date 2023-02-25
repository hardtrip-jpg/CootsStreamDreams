extends Control


func _on_CheckButton_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen


func _on_SFX_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("SFX")
	if value > $ColorRect/VBoxContainer/HBoxContainer/SFX.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)

func _on_Music_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Music")
	if value > $ColorRect/VBoxContainer/HBoxContainer2/Music.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)
