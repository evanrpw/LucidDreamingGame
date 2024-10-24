extends Node2D

@onready var interactable: Interactable = $Interactable
@export var source: Node2D
#@export_file("*.tscn") var destination: String
@export var destination: Node2D

func interact(_interactor: Node2D) -> void:
	if destination != null:
		#var instance = load(destination).instantiate()
		#_interactor.change_room(source, instance)
		_interactor.change_room(source, destination)
		
