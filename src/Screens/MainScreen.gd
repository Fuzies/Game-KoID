extends Control

func _ready():
	Bgm.play_music()

func _on_MusicButton_toggled(button_pressed):
	if(button_pressed):
		Bgm.stop_music()
	else:
		Bgm.play_music()
