extends VBoxContainer

signal on_value_ok

@export var min_value : float
@export var max_value : float

@export var slider : Slider

var is_value_ok : bool

func _ready() -> void:
	is_value_ok = false
	slider.value_changed.connect(on_slider_changed)

func on_slider_changed(value : float):
	if value <= max_value and value >= min_value:
		if not is_value_ok:
			is_value_ok = true
			on_value_ok.emit()
	else:
		if is_value_ok:
			is_value_ok = false
