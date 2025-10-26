extends ScrollContainer

@export var textures : Array[TextureRect]
var texture_size : int
var can_scroll = true
@export var stress_amount : float = -2
@export var sfx : AudioStreamPlayer
@export var delay : float = 3
var global_height : int
var texture_index : int

func _ready() -> void:
	sfx.play()
	await get_tree().process_frame
	for t in textures:
		global_height += t.size.y
	print(global_height)

	
func _input(event: InputEvent) -> void:
	if can_scroll and event.is_action_pressed("down_arrow") and not event.is_echo():
		can_scroll = false
		sfx.play()
		EventBus.add_stress_to_employee.emit(stress_amount)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scroll_vertical", self.scroll_vertical + textures[texture_index].size.y, 0.2)
		tween.tween_callback(unlock)
		texture_index += 1
		texture_index = texture_index % textures.size()

func unlock():
	print(scroll_vertical)
	if scroll_vertical >= global_height:
		scroll_vertical -= global_height
	await get_tree().create_timer(delay).timeout
	can_scroll = true
