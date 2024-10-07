extends Node2D

@onready var interactable: Interactable = $Interactable
@export var source: Node2D
@export_file("*.tscn") var destination: String

# there might be a better way to change camera bounds by room.
# maybe use room collision boxes instead of logic in door script?

signal update_camera_limits(top_left, bottom_right)

func interact(_interactor: Node2D) -> void:
	if destination != null:
		var instance = load(destination).instantiate()
		_interactor.change_room(source, instance)
