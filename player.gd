extends CharacterBody2D

@export var speed := 50
@export var friction := 0.1
@export var acceleration := 0.1

@onready var camera: Camera2D = $Camera2D
@export var starting_room: Node2D

func _ready() -> void:
	if starting_room != null:
		change_room(null, starting_room)

func _physics_process(_delta):
	var movement_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if movement_vector.length() > 0:
		velocity = lerp(velocity, movement_vector * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	move_and_slide()
	
func change_room(source, destination):
	get_tree().root.get_child(0).add_child(destination)
	if is_instance_valid(source):
		source.queue_free()
	position = Vector2(4,4)
	
	var tile_map = destination.get_node("Terrain")
	var tile_rect = tile_map.get_used_rect()
	var top_left = tile_map.map_to_local(tile_rect.position)
	var size = tile_map.map_to_local(tile_rect.size)-Vector2(8,8)
	camera.update_bounds(top_left+tile_map.position, top_left+tile_map.position+size)
