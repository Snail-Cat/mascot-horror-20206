class_name InteractionDetector
extends Area2D
## Classe responsável por detectar nodes que o jogador pode interagir no mapa

@export var interact_button : Label
var _currently_interacting :Array[Interactable] = []

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func _on_area_entered(area: Area2D):
	if !area.is_in_group(Interactable.GROUP_NAME):
		return

	_currently_interacting.append(area as Interactable)

	interact_button.visible = true


func _on_area_exited(area: Area2D):
	if !area.is_in_group(Interactable.GROUP_NAME):
		return
	
	_currently_interacting.erase(area)
	
	interact_button.visible = false


func try_interaction():
	if _currently_interacting.is_empty():
		return
	
	_currently_interacting.back().interact()
