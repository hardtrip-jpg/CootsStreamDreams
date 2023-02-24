extends Node2D

onready var health_label := $Health
onready var current_label := $Current
onready var animation := $AnimationPlayer
onready var animation_coots := $AnimationCoots
onready var timer := $Timer

var next_level_text
var now_level : String

func _ready() -> void:
	Global._initialize()
	randomize()
	Input.set_custom_mouse_cursor(null)
	BgMusicTest.bg_music()
	timer.connect("timeout", self, "timeout")
	
	#Set Level Amount
	current_label.text = str(Global.level_amount).pad_decimals(0).pad_zeros(3)
	
	#Set Health
	set_health()
	
	#Set Animation Speed and Move Camera
	animation.playback_speed = Global.current_speed
	timer.wait_time = timer.wait_time / Global.current_speed + 0.3
	animation.play("CameraMove")
	yield(animation,"animation_finished")
	
	now_level = Global._next_level()
	
	timer.start()
	BgMusicTest.bg_music()


func change_level():
	animation.play_backwards("CameraMove")
	yield(animation,"animation_finished")
	SceneTransition.change_scene(now_level,"dissolve")

func set_health() -> void:
	var health_difference := Global.health - Global.previous_health
	for lower in range(health_difference):
		var remove_item = Global.health - lower
		var temp_health = get_node("Health" + str(remove_item))
		temp_health.queue_free()
		
func timeout():
	change_level()
