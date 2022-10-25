extends Control

onready var result: Label = $Result

func _ready():
	Bgm.stop_music()
	result.text = result.text % [PlayerData.score, PlayerData.deaths]
	$GameClear.play()
