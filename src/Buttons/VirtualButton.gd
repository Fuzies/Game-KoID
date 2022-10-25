extends Node2D

func _ready():
	pass

func _on_leftbutton_pressed():
	Input.action_press("left")

func _on_leftbutton_released():
	Input.action_release("left")

func _on_rightbutton_pressed():
	Input.action_press("right")

func _on_rightbutton_released():
	Input.action_release("right")


func _on_jumpbutton_pressed():
	Input.action_press("jump")

func _on_jumpbutton_released():
	Input.action_release("jump")
