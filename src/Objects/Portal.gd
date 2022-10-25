tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

func _ready():
	get_node("Sprite").visible = false
	get_node("CollisionShape2D").visible = false
	
func _on_body_entered(body):
	pass

func teleport():
	get_tree().paused = true
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	get_tree().paused = false
	get_tree().change_scene_to(next_scene)

func enable():
	get_node("Sprite").visible = true
	get_node("CollisionShape2D").visible = true
