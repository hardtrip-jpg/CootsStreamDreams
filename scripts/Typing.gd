extends Node2D

onready var timer := $Timer
onready var animation_steps := $AnimationPlayer
onready var animation_timer := $AnimationTimer
onready var label_game_text := $GameText
onready var sfx := $SFX

export var timer_time := 3.0
export var area_array : Array = []
export var step_amounts := 1
export var game_text : String

var mouse_over := false
var is_success := false
var current_step := 1
var current_speed := Global.current_speed
var already_failed := false
var is_left := true

func _ready() -> void:
	sfx.start()
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = timer_time / current_speed
	label_game_text.text = game_text
	animation_steps.playback_speed = current_speed
	animation_timer.playback_speed = current_speed
	animation_timer.play("text")
	yield(animation_timer,"animation_finished")
	animation_timer.play("timer")
	timer.start()
	


func _process(delta: float) -> void:
	if current_step >= step_amounts:
		is_over_success()

#Interactions

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_over:
		sfx.interact()
		current_step += 1
		print(str(current_step))
		if is_left:
			is_left = false
			animation_steps.play("low")
		elif !is_left:
			is_left = true
			animation_steps.play("high")

func _on_mouse_entered() -> void:
	mouse_over = true
	
func _on_mouse_exited() -> void:
	mouse_over = false

#Special
func is_over_success() -> void:
	is_success = true
	disable()
	Global.previous_success = true
	sfx.success()
	animation_steps.play("success")
	yield(animation_steps, "animation_finished")
	transition_out()
	
func is_over_failure() -> void:
	if !already_failed:
		disable()
		Global.remaining_health -= 1
		already_failed = true
		Global.previous_success = false
		sfx.fail()
		animation_steps.play("failed")
		yield(animation_steps, "animation_finished")
		transition_out()
	
func disable() -> void:
	set_process_input(false)
	set_process(false)
	
func transition_out() -> void:
	SceneTransition.change_scene("res://uiscenes/Inbetween.tscn","dissolve")

#Timer
func _on_timer_timeout() -> void:
	if !is_success:
		is_over_failure()

func _on_Middle_mouse_entered() -> void:
	animation_steps.play("between")

