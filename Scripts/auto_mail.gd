extends RichTextLabel

@export var typing_sfx : AudioStreamPlayer
@export var finished_sfx : AudioStreamPlayer
@export var pitch_scale_range : float = 0.2

signal on_finished

func _ready() -> void:
	visible_characters = 0

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		visible_characters += 1
		typing_sfx.pitch_scale = 1 + randf_range(-pitch_scale_range, pitch_scale_range)
		typing_sfx.play()
	
	if visible_ratio == 1:
		finished_sfx.play()
		on_finished.emit()
