extends Area2D
class_name Interactable

@export var action_name: String = "interact"
@export var label : Label

func _ready() -> void:
	if label != null:
		label.text = "[E] to " + action_name


func _on_area_entered(area: Area2D) -> void:
	if area.interactables != null:
		for e in area.interactables:
			e.interactable.label.hide()
			if e.has_method("end_interaction"):
				e.end_interaction(area.get_parent())
		area.interactables.append(get_parent())
		label.show()
		print("INTERACTABLES: ", area.interactables)
		

func _on_area_exited(area: Area2D) -> void:
	if area.interactables != null:
		# yes, this does need to be in both functions
		# to avoid bug:
		# spamming interact can eg make 2 signs show at once
		for e in area.interactables:
			e.interactable.label.hide()
			if e.has_method("end_interaction"):
				e.end_interaction(area.get_parent())
		area.interactables.erase(get_parent())
		label.hide()
		if get_parent().has_method("end_interaction"):
			get_parent().end_interaction(area.get_parent())
		if (!area.interactables.is_empty()):
			area.interactables.back().interactable.label.show()
		print("INTERACTABLES: ", area.interactables)
