extends Node2D

var life = 3
var temps = 31

@onready var game_overUI = $game_over
@onready var winUI = $win
@onready var timerUI = $Timer
@onready var compteur = $Timer/Label

func _ready():
	update_lifeUI()
	_on_timer_timeout()

func update_lifeUI():
	$lifeUI/Label.text = "vie : " + str(life)

func perso_damage():
	life -= 1
	update_lifeUI()
	if life <= 0:
		game_overUI.visible = true
		$perso.queue_free()


func _on_timer_timeout():
	timerUI.start()
	compteur.text = "temps: " + str(temps - 1)
	
	temps -= 1
	
	if temps <= 5:
		compteur.modulate = Color.RED
	
	if temps <= 0:
		timerUI.stop()
		game_overUI.visible = true
		$perso.queue_free()
	
func win():
	winUI.visible = true
	timerUI.stop()
	$perso.queue_free()
