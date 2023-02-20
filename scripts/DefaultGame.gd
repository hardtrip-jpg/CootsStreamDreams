extends Node2D

onready var timer := $Timer
onready var label := $Label
onready var animation_steps := $AnimationPlayer
onready var animation_timer := $AnimationTimer
onready var label_game_text := $GameText

export var timer_time := 3.0
export var area_array : Array = []
export var step_amounts := 1
export var game_text : String


var mouse_over := false
var is_success := false
var current_step := 1
var current_speed := Global.current_speed
var already_failed := false

func _ready() -> void:
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = timer_time / current_speed
	label_game_text.text = game_text
	animation_steps.playback_speed = current_speed
	animation_steps.play("step" + str(current_step))
	timer.start()
	

#Set Timer Label
func get_time_as_text(time: float) -> String:
	return str(time).pad_decimals(2).pad_zeros(1)

func _process(delta: float) -> void:
	label.text = get_time_as_text(timer.time_left)
	if current_step >= step_amounts:
		is_over_success()
	

#Interactions

func _on_mouse_entered() -> void:
	mouse_over = true
	
func _on_mouse_exited() -> void:
	mouse_over = false

#Special
func is_over_success() -> void:
	is_success = true
	disable()
	label.text = "Success"
	
func is_over_failure() -> void:
	if !already_failed:
		disable()
		label.text = "Failure"
		Global.remaining_health -= 1
		already_failed = true
	
func disable() -> void:
	set_process_input(false)
	set_process(false)
	
func transition_out() -> void:
	SceneTransition.change_scene("res://uiscenes/Inbetween.tscn","dissolve")

#Timer
func _on_timer_timeout() -> void:
	if !is_success:
		is_over_failure()
	transition_out()
