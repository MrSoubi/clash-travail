extends ScrollContainer

@export var texture : TextureRect
var texture_size : int
var can_scroll = true
@export var max_value : int = 1028
@export var stress_amount : float = -2

func _ready() -> void:
	texture_size = texture.texture.get_height()

func _input(event: InputEvent) -> void:
	if can_scroll and event.is_action_pressed("down_arrow") and not event.is_echo():
		can_scroll = false
		EventBus.add_stress_to_employee.emit(stress_amount)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scroll_vertical", self.scroll_vertical + size.y, 0.2)
		tween.tween_callback(unlock)

func unlock():
	if scroll_vertical == max_value:
		scroll_vertical = 0
	can_scroll = true
