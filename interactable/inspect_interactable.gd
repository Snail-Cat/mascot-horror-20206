class_name InspectInteractable
extends Interactable
## Interactable que exibe uma mensagem simples

@export var text := "..."


func interact():
  print(text)
  var timeline : DialogicTimeline = DialogicTimeline.new()
  var text_event := DialogicTextEvent.new()
  text_event.text = text
  timeline.events = [text_event]
  timeline.events_processed = true
  Dialogic.start(timeline)