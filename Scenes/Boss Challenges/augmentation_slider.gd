extends VBoxContainer

signal on_value_ok
signal on_value_wrong
signal on_interact
signal on_interact_end

@export var min_value : float
@export var max_value : float

@export var slider : Slider

var is_value_ok : bool

func _ready() -> void:
	is_value_ok = false
	slider.value_changed.connect(on_slider_changed)
	slider.drag_started.connect(on_slider_dragged)
	slider.drag_ended.connect(on_slider_drag_end)

func on_slider_dragged():
	on_interact.emit()

func on_slider_changed(value : float):
	if value <= max_value and value >= min_value:
		if not is_value_ok:
			is_value_ok = true
			on_value_ok.emit()
	else:
		if is_value_ok:
			is_value_ok = false
			
func on_slider_drag_end(value : bool):
	if is_value_ok == false:
		on_value_wrong.emit()
	on_interact_end.emit()
