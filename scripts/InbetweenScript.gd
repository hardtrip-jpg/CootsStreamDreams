extends Node2D

onready var health_label := $Health
onready var current_label := $Current
onready var animation := $AnimationPlayer

var next_level_text
var now_level : String

func _ready() -> void:
	now_level = Global._next_level()
	health_label.text = str(Global.remaining_health)
	current_label.text = str(Global.level_amount)
	var health_difference := Global.health - Global.previous_health
	for lower in range(health_difference):
		var remove_item = Global.health - lower
		var temp_health = get_node("Health" + str(remove_item))
		temp_health.queue_free()
	lose_health()
	Global.previous_health = Global.remaining_health
	if Global.remaining_health <= 0:
		SceneTransition.change_scene("res://uiscenes/FailScreen.tscn", "dissolve")
	if Global.speed_level_amount >= 5:
		Global.speed_up()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		Global.level_amount += 1
		Global.speed_level_amount += 1
		SceneTransition.change_scene(now_level,"dissolve")
	
func lose_health():
	if Global.remaining_health < Global.previous_health:
		animation.play("Health" + str(Global.previous_health))
		yield(animation, "animation_finished")
		Global.previous_health = Global.remaining_health


