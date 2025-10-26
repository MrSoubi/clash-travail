extends Control

@export var animator : AnimationPlayer

@export var instruction_text : String
@export var title_text : String
@export var instruction_label : Label
@export var title_label : Label
@export var is_boss_challenge : bool

@export var start : AudioStreamPlayer
@export var three : AudioStreamPlayer
@export var two : AudioStreamPlayer
@export var one : AudioStreamPlayer
@export var go : AudioStreamPlayer

# Utiliser le bool is_boss_challenge pour changer la position des instructions
func _ready() -> void:
	start.play()
	if is_boss_challenge:
		animator.play("BossAppear")
	else:
		animator.play("EmployeeAppear")

func _on_timeout() -> void:
	animator.play("FadeOut")
	
func end() -> void:
	go.reparent(get_tree().root)
	go.play()

func threeAudio() -> void:
	three.play()

func twoAudio() -> void:
	two.play()

func oneAudio() -> void:
	one.play()
