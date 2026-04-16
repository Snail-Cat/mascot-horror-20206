class_name Player
extends CharacterBody2D
## Classe responsável pela movimentação e ações do jogador

@export var _speed := 300
var _flipped := false


func _physics_process(_delta):
  var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
  velocity = direction * _speed

  if direction.x < 0 and !_flipped:
    self.transform.x *= -1
    _flipped = true
  elif direction.x > 0 and _flipped:
    self.transform.x *= -1
    _flipped = false

  move_and_slide()