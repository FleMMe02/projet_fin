extends CanvasLayer

var pause = false

func pause_unpause():
	pause = !pause
	
	if pause:
		get_tree().paused = true
		show() #pour afficher la pause 
	else:
		get_tree().paused = false
		hide() #pour masquer la pause 
		
func _input(event):
	if event.is_action_pressed("pause"):
		pause_unpause()
