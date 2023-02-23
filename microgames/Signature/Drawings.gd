extends Node2D

var colour := preload("res://textures/signature/Colour.png")
var is_drawing := false

func _process(delta: float) -> void:
	if is_drawing:
		var sprite = Sprite.new()
		add_child(sprite)
		sprite.texture = colour
		sprite.position = get_local_mouse_position()

