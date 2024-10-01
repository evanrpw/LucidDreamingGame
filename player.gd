extends CharacterBody2D

@export var speed := 50
@export var friction := 0.1
@export var acceleration := 0.1

func _physics_process(_delta):
	var movement_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if movement_vector.length() > 0:
		velocity = lerp(velocity, movement_vector * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	move_and_slide()
