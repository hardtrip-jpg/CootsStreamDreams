extends AudioStreamPlayer

var bg_music := preload("res://sound/We Shop Song.ogg")
var boss_fight := preload("res://sound/bossmusic.wav")
var menu_mus := preload("res://sound/cootsdreams_mainmenu.wav")

func _ready() -> void:
	pitch_scale = 1

func speed_up():
	stop()
	stream = bg_music
	pitch_scale = Global.current_speed
	play()
	
func bg_music():
	if stream != bg_music:
		stop()
		stream = bg_music
		pitch_scale = Global.current_speed
		play()
	
func menu_music():
	if stream != menu_mus:
		stop()
		stream = menu_mus
		pitch_scale = 1
		play()


func boss_music():
	stop()
	stream = boss_fight
	pitch_scale = 1
	play()

func title_music():
	stop()
	stream = boss_fight
	pitch_scale = 1
