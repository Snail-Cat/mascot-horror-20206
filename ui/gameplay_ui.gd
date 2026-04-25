extends Control

@export var battery : Battery

@export var bar : Array[ProgressBar]

func _process(_delta):
	for i in 3:
		if i > battery.current_level:
			bar[i].value = 0
		elif i < battery.current_level:
			bar[i].value = 100
		else:
			bar[i].value = battery.current_level_duration
