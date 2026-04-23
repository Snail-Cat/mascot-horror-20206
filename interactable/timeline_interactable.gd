class_name TimelinetInteractable
extends Interactable
## Interactable que inicia uma timeline do Dialogic

@export var timeline_name := ""


func interact():
	Dialogic.start(timeline_name)
