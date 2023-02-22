extends Sprite

export var area_2d : NodePath

signal no_longer_over

var mouse_over = false

func _ready() -> void:
	var current_area = get_node(area_2d)
	current_area.connect("mouse_entered", self, "mouse_entered")
	current_area.connect("mouse_exited", self, "mouse_exited")
	
func mouse_entered() -> void:
	mouse_over = true

func mouse_exited() -> void:
	mouse_over = false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_over:
		yield(get_tree().create_timer(0.1), "timeout")
		emit_signal("no_longer_over")
		queue_free()
