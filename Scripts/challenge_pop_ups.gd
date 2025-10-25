extends Control

@export var popup = preload("res://Scenes/pop_up.tscn")
@export var positions : Array[Node]

func _ready() -> void:
	for i in range(positions.size()):
		var new_popup = popup.instantiate()
		add_child(new_popup)
		new_popup.position = positions[i].position
		
