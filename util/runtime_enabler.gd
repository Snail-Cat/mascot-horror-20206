class_name RuntimeEnabler
extends Node
## Node que revela um node pai apenas quando o jogo estiver em execução
## Utilizado para facilitar o trabalho com nodes de iluminação


func _ready():
  get_parent().show()
