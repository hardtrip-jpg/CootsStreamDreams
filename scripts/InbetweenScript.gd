extends Node2D

onready var health_label := $Health
onready var current_label := $Current
onready var animation := $AnimationPlayer
onready var animation_coots := $AnimationCoots
onready var timer := $Timer

var next_level_text
var now_level : String

func _ready() -> void:
	randomize()
	Input.set_custom_mouse_cursor(null)
	BgMusicTest.bg_music()
	timer.connect("timeout", self, "timeout")
	#Set Level Amount
	Global.level_amount += 1
	Global.speed_level_amount += 1
	current_label.text = str(Global.level_amount).pad_decimals(0).pad_zeros(3)
	
	#Determine Success
	animation_coots.playback_speed = Global.current_speed
	if Global.previous_success:
		animation_coots.play("success")
	else:
		animation_coots.play("failed")
		
	#Set Health
	set_health()
	
	#Set Animation Speed and Move Camera
	animation.playback_speed = Global.current_speed
	timer.wait_time = timer.wait_time / Global.current_speed + 0.3
	animation.play("CameraMove")
	yield(animation,"animation_finished")
	
	now_level = Global._next_level()
	
	if Global.remaining_health < Global.previous_health:
		animation.play("Health" + str(Global.previous_health))
		Global.previous_health = Global.remaining_health
		yield(animation, "animation_finished")
	
	Global.previous_health = Global.remaining_health
	if Global.remaining_health <= 0:
		SceneTransition.change_scene("res://uiscenes/FailScreen.tscn", "dissolve")
	
	if Global.speed_level_amount > 4:
		Global.speed_up()
		BgMusicTest.speed_up()
		animation.play("SpeedUp")
		yield(animation, "animation_finished")
	else:
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
