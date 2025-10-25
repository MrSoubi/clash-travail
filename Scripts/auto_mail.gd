extends RichTextLabel

@export var typing_sfx : AudioStreamPlayer
@export var finished_sfx : AudioStreamPlayer

func _ready() -> void:
	visible_characters = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("key_mail") and not event.is_echo():
		visible_characters += 1
		typing_sfx.play()
	
	if visible_ratio == 1:
		finished_sfx.play()
		EventBus.on_challenge_completed.emit(false)
