extends CharacterBody2D
class_name perso

signal get_damaged #signal de dommage du perso

#variables de déplacement 
@export var gravity = 340
@export var speed = 220
@export var jump_force = 220

@export var acceleration = 0.2
#variable d'animation du personnage 
@onready var ani_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor(): #si le joueur est sur le sol
		velocity.y = clamp(velocity.y + gravity * delta, -500, 500)
	
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		ani_sprite.flip_h = (direction == -1)
	
	if Input.is_action_just_pressed("jump") and is_on_floor(): # si le joueur saute 
		velocity.y = -jump_force
	velocity.x = lerp(velocity.x, direction * speed, acceleration)
	update_animation(direction)
	move_and_slide()

func update_animation(direction): #les animations 
	if is_on_floor():
		if direction == 0:
			ani_sprite.play("idle")
		else:
			ani_sprite.play("run")
	else:
		ani_sprite.play("jump")
	
func take_damage():
	get_damaged.emit()
