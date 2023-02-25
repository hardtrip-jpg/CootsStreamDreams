extends AudioStreamPlayer

export var start : Resource
export var success : Resource = preload ("res://sound/496087__dastudiospr__male-yeah.wav")
export var fail : Resource = preload ("res://sound/Roblox Angry Sound Effect.ogg")
export var interact : Resource = preload("res://sound/switch24.wav")

func start() -> void:
	pitch_scale = 1
	stream = start
	play()

func success() -> void:
	pitch_scale = 1
	stream = success
	play()
	
func fail() -> void:
	pitch_scale = 1
	stream = fail
	play()

func interact() -> void:
	pitch_scale = 1
	stream = interact
	play()

func interact_random() -> void:
	pitch_scale = rand_range(0.8,2)
	stream = interact
	play()
	
