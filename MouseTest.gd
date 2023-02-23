extends Node2D

var mouse_test : int

func _input(event):
 if event is InputEventMouseMotion:
	 mouse_test += 1
	
func _physics_process(delta: float) -> void:
	print(mouse_test)
