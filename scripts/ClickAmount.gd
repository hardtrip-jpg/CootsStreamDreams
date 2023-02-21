extends "DefaultGame.gd"

onready var amount_text := $AmountText

export var click_amount : int

var current_amount : int = 0

func _process(delta: float) -> void:
	amount_text.text = get_amount_as_text(click_amount - current_amount)
	if current_step >= step_amounts:
		is_over_success()

func _input(event: InputEvent) -> void:
	if mouse_over and event.is_action_pressed("click"):
		current_amount += 1
		check_amount()
	elif event.is_action_pressed("click"):
		is_over_failure()

func check_amount() -> void:
	if current_amount == click_amount:
		current_step += 1
		animation_steps.play("step" + str(current_step))

func get_amount_as_text(time: float) -> String:
	return str(time).pad_decimals(0).pad_zeros(2)
