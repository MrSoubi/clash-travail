extends Node2D

@onready var parent = get_parent() as PathFollow2D

var time = randf_range(0, 3)

func _ready() -> void:
	$AnimationPlayer.seek(time, true)

func _physics_process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 300 * delta)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print("clicked")
	pass
