extends Control

@export var flies : Array[Node2D]

var flies_count : int

func _ready() -> void:
	flies_count = flies.size()
	for fly in flies:
		fly.tree_exited.connect(on_fly_dead)

func on_fly_dead():
	flies_count -= 1
	if flies_count == 0:
		print("FINI")
