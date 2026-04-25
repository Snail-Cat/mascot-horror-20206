extends AudioStreamPlayer

@export var battery: Battery
@export var timer: Timer


func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	if battery.is_low_battery():
		play()
