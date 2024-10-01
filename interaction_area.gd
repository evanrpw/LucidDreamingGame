extends Area2D

@export var interactor: Node2D # player

var interactables = []
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && !interactables.is_empty():
		interactables.back().interact(interactor)
