extends "DefaultGame.gd"

onready var ontime := $OnTime

var is_timing := false

func _ready() -> void:
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = timer_time / current_speed
	animation_steps.playback_speed = animation_steps.playback_speed * current_speed
	ontime.playback_speed = ontime.playback_speed * current_speed
	animation_steps.play("step" + str(current_step))
	timer.start()

func _input(event: InputEvent) -> void:
	if mouse_over and event.is_action_pressed("click") and is_timing:
		current_step += 1
		animation_steps.play("step" + str(current_step))
	elif event.is_action_pressed("click"):
		is_over_failure()

func _toggle_timing() -> void:
	if not is_timing:
		is_timing = true
	else:
		is_timing = false
