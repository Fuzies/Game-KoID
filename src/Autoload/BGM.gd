extends Node

var bgm_music = load("res://src/Sounds/BGM.mp3")

func _ready():
	pass

func play_music():
	$Music.stream = bgm_music
	$Music.play()

func stop_music():
	$Music.stream = bgm_music
	$Music.stop()
