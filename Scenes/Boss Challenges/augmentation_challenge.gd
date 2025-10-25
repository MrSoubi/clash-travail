extends Control

@export var sliders : Array[Node]

func _ready() -> void:
	for s in sliders:
		s.on_value_ok.connect(check_challenge)

func check_challenge():
	var result : bool = true
	for s in sliders:
		result = result and s.is_value_ok
	
	if result:
		EventBus.on_challenge_completed.emit()
