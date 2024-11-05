extends Node2D

@onready var interactable: Interactable = $Interactable
#@export var sign_text_label: Label

@export_multiline var dialog_text : Array[String] = ["Hello, world"]
var text_index = 0

func interact(_interactor: Node2D) -> void:
	_interactor.dialog.show()
	interactable.label.hide()
	if text_index < dialog_text.size():
		_interactor.dialog_label.text = dialog_text[text_index]
		if text_index < dialog_text.size()-1:
			_interactor.dialog_label.text += " [E]"
		text_index += 1
	# decide on sign reading behavior
	#else:
		#end_interaction()
		#interactable.label.show()

func end_interaction(interactor) -> void:
	interactor.dialog.hide()
	#sign_text_label.text = ""
	text_index = 0
