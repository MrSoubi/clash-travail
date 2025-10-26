extends Sprite2D

var start_position : Vector2
var start_mouse_position : Vector2

func _ready() -> void:
	start_position = position
	start_mouse_position = get_viewport().get_mouse_position()

func _process(delta: float) -> void:
	position = start_position + (get_viewport().get_mouse_position() - start_mouse_position) / 10
