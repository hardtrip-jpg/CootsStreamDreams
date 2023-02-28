extends Node2D

onready var animation_steps := $AnimationPlayer
onready var sfx := $SFX

export var timer_time := 3.0
export var area_array : Array = []

export var game_text : String

var mouse_over := false

var current_speed := Global.current_speed
var already_failed := false
var is_high := false

func _ready() -> void:
	BgMusicTest.menu_music()
	for area in area_array:
		if area:
			var current_area = get_node(area)
			current_area.connect("mouse_entered", self, "_on_mouse_entered")
			current_area.connect("mouse_exited", self, "_on_mouse_exited")
	animation_steps.playback_speed = 1


#Interactions

func _on_mouse_entered() -> void:
	sfx.interact()
	if is_high:
		is_high = false
		animation_steps.play("high")
	elif !is_high:
		is_high = true
		animation_steps.play("low")
	
func _on_mouse_exited() -> void:
	mouse_over = false

#Special
	
func disable() -> void:
	set_process_input(false)
	set_process(false)
	
func transition_out() -> void:
	SceneTransition.change_scene("res://uiscenes/Credits.tscn","none")

#Timer

func _on_Middle_mouse_entered() -> void:
	animation_steps.play("between")

