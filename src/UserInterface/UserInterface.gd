extends Node

onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $Score
onready var pause_overlay: ColorRect = $PauseOverlay
onready var title_label: Label = $PauseOverlay/Title
onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton

const MESSAGE_DIED: = "KAMU MATI!"

var paused: = false setget set_paused

func _ready():
	PlayerData.connect("updated", self, "update_interface")
	PlayerData.connect("died", self, "_on_Player_died")
	PlayerData.connect("reset", self, "_on_Player_reset")
	update_interface()

func _on_Player_died():
	self.paused = true
	title_label.text = MESSAGE_DIED
	$PlayerDied.play()

func _on_Player_reset():
	self.paused = false

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause") and title_label.text != MESSAGE_DIED:
		self.paused = not self.paused

func update_interface():
	score_label.text = "Skor: %s" % PlayerData.score

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func _on_PauseButton_pressed():
	self.paused = true
	scene_tree.paused = true
	pause_overlay.visible = true

func _on_PauseButton_released():
	self.paused = false
	scene_tree.paused = false
	pause_overlay.visible = false
