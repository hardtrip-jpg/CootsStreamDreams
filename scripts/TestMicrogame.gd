extends Node2D

onready var timer := $Timer
onready var label := $Label
onready var animation := $AnimationPlayer

export var step_amounts : int
export var current_speed := 1.0
export var timer_time := 3.0
export var area_array : Array = []


var mouse_over := false
var is_success := false
var current_step := 1

func _ready() -> void:
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = timer_time / current_speed
	animation.playback_speed = animation.playback_speed * current_speed
	animation.play("step" + str(current_step))
	timer.start()

#Set Timer Label
func get_time_as_text(time: float) -> String:
	return str(time).pad_decimals(2).pad_zeros(1)

func _process(delta: float) -> void:
	label.text = get_time_as_text(timer.time_left)
	if current_step >= step_amounts:
		is_over_success()
	

#Interactions
func _input(event: InputEvent) -> void:
	if mouse_over and event.is_action_pressed("click"):
		current_step += 1
		animation.play("step" + str(current_step))

func _on_mouse_entered() -> void:
	mouse_over = true
	
func _on_mouse_exited() -> void:
	mouse_over = false

func is_over_success() -> void:
	is_success = true
	timer.stop()
	_on_timer_timeout()


#Timer
func _on_timer_timeout() -> void:
	set_process_input(false)
	set_process(false)
	if is_success:
		label.text = "Success"
	else:
		label.text = "Failed"
