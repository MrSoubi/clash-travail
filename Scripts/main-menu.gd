extends Control

@export var game : Control

func _ready() -> void:
	game.visible = false
	game.set_process(false)
	
func _on_play_button_pressed() -> void:
	game.visible = true
	game.set_process(true)
	self.visible = false
	self.set_process(false)
