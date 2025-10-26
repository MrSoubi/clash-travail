extends Control

@export var upSprite : TextureRect
@export var downSprite : TextureRect
var baseSize : Vector2 = Vector2(1, 1)
var bigSize : Vector2 = Vector2(1.2, 1.2)

var sequence = [
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
	'Up',
	'Down',
]

var sequence_index = 0

func _ready() -> void:
	downSprite.scale = baseSize
	downSprite.modulate.a = 0.5
	upSprite.scale = bigSize
	upSprite.modulate.a = 1

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.as_text_keycode() == sequence[sequence_index]:
			sequence_index += 1
			if event.as_text_keycode() == "Down":
				downSprite.scale = baseSize
				downSprite.modulate.a = 0.5
				upSprite.scale = bigSize
				upSprite.modulate.a = 1
			if event.as_text_keycode() == "Up":
				downSprite.scale = bigSize
				downSprite.modulate.a = 1
				upSprite.scale = baseSize
				upSprite.modulate.a = 0.5
			if sequence_index == sequence.size():
				EventBus.on_challenge_completed.emit()
				sequence_index = 0
		#else:
			#sequence_index = 0
