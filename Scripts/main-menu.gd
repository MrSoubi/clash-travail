extends Control

@export var game : Control
@export var start : AudioStreamPlayer

func _ready() -> void:
	game.visible = false
	game.set_process(false)
	
func _on_play_button_pressed() -> void:
	start.play()
	game.visible = true
	game.set_process(true)
	self.visible = false
	self.set_process(false)
	game.next_challenge()
