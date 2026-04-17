class_name Player
extends CharacterBody2D
## Classe responsável pela movimentação e ações do jogador

@export var _speed := 300
var _flipped := false
var _can_move := true
var _can_interact := true
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


func _on_timeline_started():
  _can_move = false
  _can_interact = false


func _on_timeline_ended():
  _can_move = true
  _can_interact = true