extends Node2D

@onready var interactable: Interactable = $Interactable
@export var sign_text_label: Label

@export_multiline var sign_text : Array[String] = ["Hello, world"]
var text_index = 0

func interact(_interactor: Node2D) -> void:
	interactable.label.hide()
	if text_index < sign_text.size():
		sign_text_label.text = sign_text[text_index]
		if text_index < sign_text.size()-1:
			sign_text_label.text += " [E]"
		text_index += 1
	# decide on sign reading behavior
	#else:
		#end_interaction()
		#interactable.label.show()

func end_interaction(_interactor) -> void:
	sign_text_label.text = ""
	text_index = 0
