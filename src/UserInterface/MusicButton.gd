extends TextureButton

func _ready():
	pass

func _on_MusicButton_toggled(button_pressed):
	if(button_pressed):
		Bgm.stop_music()
	else:
		Bgm.play_music()
