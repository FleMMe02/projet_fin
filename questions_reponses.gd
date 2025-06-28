extends Node2D
signal b_r

var reponses = {
	"reponse": false,
	"reponse2": false,
	"reponse3": true,
	"reponse4": false
}
@onready var sprite = $reponse/Sprite2D
@onready var sprite2 = $reponse2/Sprite2D
@onready var sprite3 = $reponse3/Sprite2D
@onready var sprite4 = $reponse4/Sprite2D

func _on_reponse_body_entered(body):
	if body is perso:
		if reponses["reponse"]:
			sprite.modulate = Color(0, 1, 0)
		else:
			sprite.modulate = Color(1, 0, 0)
			body.take_damage()

func _on_reponse_2_body_entered(body):
	if body is perso:
		if reponses["reponse"]:
			sprite2.modulate = Color(0, 1, 0)
		else:
			sprite2.modulate = Color(1, 0, 0)
			body.take_damage()
	

func _on_reponse_3_body_entered(body):
	if body is perso:
		if reponses["reponse"]:
			sprite3.modulate = Color(1, 0, 0)
		else:
			sprite3.modulate = Color(0, 1, 0)
			b_r.emit()

func _on_reponse_4_body_entered(body):
	if body is perso:
		if reponses["reponse"]:
			sprite4.modulate = Color(0, 1, 0)
		else:
			sprite4.modulate = Color(1, 0, 0)
			body.take_damage()
