extends TextureRect

@export var sfx : AudioStreamPlayer

func _on_button_pressed() -> void:
	sfx.play()
	sfx.reparent(get_tree().root)
	get_parent().queue_free()
