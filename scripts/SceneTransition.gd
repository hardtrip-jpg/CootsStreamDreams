extends CanvasLayer

func change_scene(target: String, transition: String) -> void:
	$AnimationPlayer.play(transition)
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards(transition)
