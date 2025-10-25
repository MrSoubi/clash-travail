extends Control

@export var animator : AnimationPlayer
@export var prompt : Label

func _ready() -> void:
	print("launched")
	animator.play("Appear")

func _on_timeout() -> void:
	animator.play("FadeOut")
