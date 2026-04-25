class_name Player
extends CharacterBody2D
## Classe responsável pela movimentação e ações do jogador

@export var _speed := 300
@export var battery: Battery
@export var recharge_bar: ProgressBar
var _flipped := false
var _can_move := true
var _can_interact := true
var time_pressed := 0.0 
var recharge_completed := false
@onready var _sprite := $Sprite as Sprite2D
@onready var _interaction_detector := $InteractionDetector as InteractionDetector


func _ready():
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)


func _physics_process(_delta):
	if !_can_move:
		return
	
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * _speed

	if direction.x < 0 and !_flipped:
		_sprite.transform.x *= -1
		_flipped = true
	elif direction.x > 0 and _flipped:
		_sprite.transform.x *= -1
		_flipped = false

	move_and_slide()


func _process(_delta):
	if Input.is_action_just_pressed("interact") and _can_interact:
		_interaction_detector.try_interaction()
	
	if Input.is_action_pressed("recharge_battery") and !recharge_completed: # and battery_count > 0:
		var max_time_pressed := 2.0
		
		_can_move = false
		_can_interact = false
		recharge_bar.visible = true # pode ser colocado no control depois
		
		recharge_bar.value = time_pressed # pode ser colocado no control depois
		time_pressed += _delta
		
		if time_pressed > max_time_pressed:
			battery.current_level = 2
			battery.current_level_duration = 100
			time_pressed = 0
			recharge_completed = true
	else:
		time_pressed = 0
		recharge_bar.visible = false # pode ser colocado no control depois
		
		_can_move = true
		_can_interact = true
	
	if Input.is_action_just_released("recharge_battery"):
		recharge_completed = false
	
	if Input.is_action_pressed("death_test"):
		GameManager.game_over()


func _on_timeline_started():
	_can_move = false
	_can_interact = false
	set_process(false)


func _on_timeline_ended():
	await get_tree().process_frame
	_can_move = true
	_can_interact = true
	set_process(true)
