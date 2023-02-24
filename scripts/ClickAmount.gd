extends "DefaultGame.gd"

export var click_amount : int

var current_amount : int = 0

func _ready() -> void:
	click_amount = click_amount / Global.current_speed

func _process(delta: float) -> void:
	if current_step >= step_amounts:
		is_over_success()

func _input(event: InputEvent) -> void:
	if mouse_over and event.is_action_pressed("click"):
		current_amount += 1
		check_amount()
		animation_steps.play("step1")
		sfx.interact()
	elif event.is_action_pressed("click"):
		is_over_failure()

func check_amount() -> void:
	if current_amount == click_amount:
		current_step += 1

