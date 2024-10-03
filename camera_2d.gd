extends Camera2D

@onready var topLeft: Marker2D = $"Limits/Top Left"
@onready var bottomRight: Marker2D = $"Limits/Bottom Right"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRight.position.y
	limit_right = bottomRight.position.x
