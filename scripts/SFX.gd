extends AudioStreamPlayer

var success := preload ("res://sound/496087__dastudiospr__male-yeah.wav")
var fail := preload ("res://sound/Roblox Angry Sound Effect.ogg")
var interact := preload("res://sound/switch24.wav")

func success() -> void:
	stream = success
	play()
	
func fail() -> void:
	stream = fail
	play()

func interact() -> void:
	stream = interact
	play()
