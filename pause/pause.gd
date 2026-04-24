extends Node

@export var pause_button : Button


func _process(_delta) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		pause_button.visible = !pause_button.visible


func _on_button_pressed() -> void:
	get_tree().paused = false
	pause_button.visible = false
