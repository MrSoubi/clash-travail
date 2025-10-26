extends Panel

@export var sfx : AudioStreamPlayer

func _on_button_pressed() -> void:
	sfx.play()
	sfx.reparent(get_tree().root)
	queue_free()
