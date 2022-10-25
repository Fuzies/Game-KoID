extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 100

func _on_body_entered(body):
	picked()
	$CoinSound.play()

func picked():
	PlayerData.score += score
	anim_player.play("picked")
