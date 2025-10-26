extends Control

@export var choices : Array[Control]

func _ready() -> void:
	for c in choices:
		c.visible = false
	
	choices[randi_range(0, choices.size()-1)].visible = true
