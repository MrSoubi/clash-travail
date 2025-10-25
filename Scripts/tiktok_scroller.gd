extends ScrollContainer

@export var texture : TextureRect
var texture_size : int
var can_scroll = true
@export var stress_amount : float = -2

func _input(event: InputEvent) -> void:
	if can_scroll and event.is_action_pressed("down_arrow") and not event.is_echo():
		can_scroll = false
		EventBus.add_stress_to_employee.emit(stress_amount)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scroll_vertical", self.scroll_vertical + texture.size.y, 0.2)
		tween.tween_callback(unlock)

func unlock():
	if scroll_vertical >= texture_size:
		scroll_vertical -= texture.size.y
	can_scroll = true
