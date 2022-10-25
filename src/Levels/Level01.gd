extends Node2D

var jumEnemies = 5
var bunuh = 0

func _ready():
	update_jumvirus()

func update_jumvirus():
	get_node("InterfaceLayer/UserInterface/Virus").text = "Virus Mati : "+str(bunuh)+"/"+str(jumEnemies)

func _on_StompDetector_area_entered(area):
	bunuh += 1
	update_jumvirus()
	if bunuh == jumEnemies:
		get_node("Portal").enable()

func _on_Portal2D_body_entered(body):
	if bunuh == jumEnemies:
		get_node("Portal").teleport()
		get_node("Portal/NextStage").play()
