extends Node2D

@onready var parent = get_parent() as PathFollow2D
@export var flyingAudio : Array[AudioStreamPlayer]

var time = randf_range(0, 3)

func _ready() -> void:
	flyingAudio[randi_range(0, 2)].play()
	$AnimationPlayer.seek(time, true)

func _physics_process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 300 * delta)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		self.queue_free()
		print("clicked")
	pass
