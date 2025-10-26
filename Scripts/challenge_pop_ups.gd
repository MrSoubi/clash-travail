extends Control

@export var popup = preload("res://Scenes/pop_up.tscn")
@export var positions : Array[Node]
var popup_count : int
@export var sfx : AudioStreamPlayer

func _ready() -> void:
	popup_count = positions.size()
	for i in range(positions.size()):
		var new_popup = popup.instantiate()
		add_child(new_popup)
		new_popup.position = positions[i].position
		new_popup.tree_exited.connect(on_popup_closed)
		
func on_popup_closed():
	popup_count -= 1
	if popup_count == 0:
		sfx.play()
		EventBus.on_challenge_completed.emit()
