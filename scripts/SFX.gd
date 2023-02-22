extends AudioStreamPlayer

export var success : Resource = preload ("res://sound/496087__dastudiospr__male-yeah.wav")
export var fail : Resource = preload ("res://sound/Roblox Angry Sound Effect.ogg")
export var interact : Resource = preload("res://sound/switch24.wav")

func success() -> void:
	stream = success
	play()
	
func fail() -> void:
	stream = fail
	play()

func interact() -> void:
	stream = interact
	play()
