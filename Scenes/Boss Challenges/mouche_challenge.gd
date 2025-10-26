extends Control

@export var flies : Array[Node2D]
@export var flySmashAudio : AudioStreamPlayer
@export var main : Node2D
@export var main_1 : Sprite2D
@export var main_2 : Sprite2D

var flies_count : int

func _ready() -> void:
	main_2.visible = false
	flies_count = flies.size()
	for fly in flies:
		fly.tree_exited.connect(on_fly_dead)

func _process(delta: float) -> void:
	main.position = get_viewport().get_mouse_position()

func on_fly_dead():
	flies_count -= 1
	flySmashAudio.pitch_scale = randf_range(0.85, 1.15)
	flySmashAudio.play()
	main_2.visible = true
	main_1.visible = false
	if flies_count == 0:
		flySmashAudio.reparent(get_tree().root)
		EventBus.on_challenge_completed.emit()
	else:
		await get_tree().create_timer(0.2).timeout
		main_1.visible = true
		main_2.visible = false
