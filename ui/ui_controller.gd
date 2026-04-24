class_name UIController
extends Node
## Node responsavel por alternar a interface exibida atualmente

@export var default_ui: Control
var _current_ui: Control


func _ready():
	_current_ui = default_ui
	_current_ui.show()
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)


func request_visibility(node: Control):
	_current_ui.hide()
	_current_ui = node
	node.show()


func reset_default():
	_current_ui.hide()
	_current_ui = default_ui
	default_ui.show()


func _on_timeline_started():
	_current_ui.hide()


func _on_timeline_ended():
	_current_ui.show()
