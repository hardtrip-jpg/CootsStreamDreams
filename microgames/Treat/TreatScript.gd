extends Sprite

export var area_2d : NodePath

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
		queue_free()
