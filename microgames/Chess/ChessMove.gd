extends Sprite

var is_grabbed := false

func _process(delta: float) -> void:
	if is_grabbed:
		position = get_global_mouse_position()
	

func toggle_grab() -> void:
	if is_grabbed:
		is_grabbed = false
	elif !is_grabbed:
		is_grabbed = true
