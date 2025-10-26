extends Control

@export var flies : Array[Node2D]
@export var flySmashAudio : AudioStreamPlayer

var flies_count : int

func _ready() -> void:
	flies_count = flies.size()
	for fly in flies:
		fly.tree_exited.connect(on_fly_dead)

func on_fly_dead():
	flies_count -= 1
	flySmashAudio.pitch_scale = randf_range(0.85, 1.15)
	flySmashAudio.play()
	if flies_count == 0:
		flySmashAudio.reparent(get_tree().root)
		EventBus.on_challenge_completed.emit()
