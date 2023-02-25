extends Node2D

onready var animation_steps := $AnimationPlayer
onready var animation_timer := $AnimationTimer
onready var label_game_text := $GameText
onready var sfx := $SFX

export var timer_time := 3.0
export var area_array : Array = []
export var step_amounts := 1
export var game_text : String
export var not_spamming := true

var mouse_over := false
var is_success := false
var current_step := 1
var already_failed := false
var is_timing := false
var current_speed := 1.3
var current_smash : int

func _ready() -> void:
	BgMusicTest.boss_music()
	sfx.start()
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	label_game_text.text = game_text
	animation_steps.play("step" + str(current_step))
	animation_timer.play("text")
	yield(animation_timer, "animation_finished")
	animation_timer.play("timer")


func _process(delta: float) -> void:
	if current_step >= step_amounts:
		is_over_success()
		
	animation_steps.playback_speed = current_speed
	animation_timer.playback_speed = current_speed
	

#Interactions

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
	SceneTransition.change_scene("res://uiscenes/StartMenu.tscn","dissolve")
	
func is_over_failure() -> void:
	if !already_failed:
		disable()
		Global.remaining_health -= 1
		already_failed = true
		Global.previous_success = false
		sfx.fail()
		animation_steps.play("failed")
		yield(animation_steps, "animation_finished")
		SceneTransition.change_scene("res://uiscenes/Inbetween.tscn","dissolve")
	
func disable() -> void:
	set_process_input(false)
	set_process(false)
	
	

#Timer
func _on_timer_timeout() -> void:
	if !is_success:
		is_over_failure()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_over and !not_spamming:
		current_speed = 2
		current_smash += 1
		if current_smash >= 10:
			current_smash = 0
			doing()
	elif event.is_action_pressed("click") and mouse_over:
		doing()
	elif event.is_action_pressed("click"):
		is_over_failure()

func doing() -> void:
	current_step += 1
	current_speed += .25
	animation_steps.play("step" + str(current_step))
	animation_timer.seek(0)
