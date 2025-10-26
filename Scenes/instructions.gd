extends Control

@export var animator : AnimationPlayer

@export var instruction_text : String
@export var title_text : String
@export var instruction_label : Label
@export var title_label : Label
@export var is_boss_challenge : bool

# Utiliser le bool is_boss_challenge pour changer la position des instructions
func _ready() -> void:
	animator.play("Appear")

func _on_timeout() -> void:
	animator.play("FadeOut")
