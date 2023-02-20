extends Node2D

onready var health_label := $Health
onready var current_label := $Current
onready var animation := $AnimationPlayer

var next_level_text
var now_level : String

func _ready() -> void:
	set_health()
	current_label.text = str(Global.level_amount)
	animation.playback_speed = Global.current_speed * Global.animation_speed
	animation.play("CameraMove")
	yield(animation,"animation_finished")
	now_level = Global._next_level()
	lose_health()
	yield(animation, "animation_finished")
	Global.previous_health = Global.remaining_health
	if Global.remaining_health <= 0:
		SceneTransition.change_scene("res://uiscenes/FailScreen.tscn", "dissolve")
	if Global.speed_level_amount >= 5:
		Global.speed_up()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		change_level()
		Global.speed_up()

	
func lose_health() -> void:
	if Global.remaining_health < Global.previous_health:
		animation.play("Health" + str(Global.previous_health))
		Global.previous_health = Global.remaining_health

func change_level() -> void:
	Global.level_amount += 1
	Global.speed_level_amount += 1
	animation.play_backwards("CameraMove")
	yield(animation,"animation_finished")
	SceneTransition.change_scene(now_level,"dissolve")

func set_health() -> void:
	var health_difference := Global.health - Global.previous_health
	for lower in range(health_difference):
		var remove_item = Global.health - lower
		var temp_health = get_node("Health" + str(remove_item))
		temp_health.queue_free()
		
func speed_up_animation() -> void:
	animation.playback_speed = 1
