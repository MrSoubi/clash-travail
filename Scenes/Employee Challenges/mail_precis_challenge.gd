extends Control

var sequence1 = [
	'W',
	'O',
	'R',
	'K',
]

var sequence2 = [
	'M',
	'O',
	'N',
	'E',
	'Y',
]

var sequence3 = [
	'O',
	'F',
	'F',
	'I',
	'C',
	'E',
]

var sequence4 = [
	'B',
	'U',
	'R',
	'N',
	'O',
	'U',
	'T',
]

var sequence5 = [
	'B',
	'U',
	'S',
	'I',
	'N',
	'E',
	'S',
	'S',
]

var sequence6 = [
	'S',
	'A',
	'R',
	'K',
	'O',
	'Z',
	'Y',
]

var sequence7 = [
	'B',
	'I',
	'L',
	'L',
	'S',
]

var sequence8 = [
	'C',
	'O',
	'N',
	'S',
	'U',
	'M',
	'E',
]

var allSequences = [sequence1, sequence2, sequence3, sequence4, sequence5, sequence6, sequence7, sequence8, ]

var sequence_index = 0

var sequence

func _ready() -> void:
	sequence = allSequences[RandomNumberGenerator.new().randi_range(0, allSequences.size()-1)]
	txt_info.text = ""
	for c in sequence:
		txt_info.text += c
	

@export var txt : Label
@export var txt_info : Label

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.as_text_keycode() == sequence[sequence_index]:
			txt.text += event.as_text()
			sequence_index += 1
			if sequence_index == sequence.size():
				EventBus.on_challenge_completed.emit()
				sequence_index = 0
