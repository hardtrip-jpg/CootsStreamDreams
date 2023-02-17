extends Node2D

onready var area := $Area2D
onready var timer := $Timer
onready var label := $Label

export var timer_time := 3.0

var mouse_over := false
var is_success := false

func _ready() -> void:
	area.connect("mouse_entered", self, "_on_mouse_entered")
	area.connect("mouse_exited", self, "_on_mouse_exited")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = timer_time
	timer.start()

func get_time_as_text(time: float) -> String:
	return str(time).pad_decimals(2).pad_zeros(1)

func _process(delta: float) -> void:
	label.text = get_time_as_text(timer.time_left)
	
func _input(event: InputEvent) -> void:
	if mouse_over and event.is_action_pressed("click"):
		is_success = true
	
func _on_mouse_entered() -> void:
	mouse_over = true
	
func _on_mouse_exited() -> void:
	mouse_over = false

func _on_timer_timeout() -> void:
	set_process_input(false)
	set_process(false)
	if is_success:
		print("Success")
	else:
		print("Failed")
