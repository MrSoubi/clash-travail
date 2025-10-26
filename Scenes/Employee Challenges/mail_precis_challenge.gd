extends Control

var sequence1 = [
	'P',
	'R',
	'E',
	'S',
	'I',
	'D',
	'E',
	'N',
	'T',
]

var sequence2 = [
	'G',
	'A',
	'M',
	'E',
	'D',
	'E',
	'V',
]

var sequence3 = [
	'F',
	'E',
	'R',
	'M',
	'I',
	'E',
	'R',
]

var sequence4 = [
	'P',
	'H',
	'I',
	'L',
	'O',
	'S',
	'O',
	'P',
	'H',
	'E',
]

var sequence5 = [
	'C',
	'H',
	'O',
	'M',
	'E',
	'U',
	'S',
	'E',
]

var sequence6 = [
	'P',
	'I',
	'Z',
	'Z',
	'A',
	'I',
	'O',
	'L',
	'O',
]

var sequence7 = [
	'M',
	'E',
	'D',
	'E',
	'C',
	'I',
	'N',
]

var sequence8 = [
	'C',
	'O',
	'B',
	'A',
	'Y',
	'E',
]

var sequence9 = [
	'G',
	'A',
	'N',
	'G',
	'S',
	'T',
	'E',
	'R',
]

var allSequences = [sequence1, sequence2, sequence3, sequence4, sequence5, sequence6, sequence7, sequence8, sequence9, ]

var sequence_index = 0

var sequence

@export var type : AudioStreamPlayer

func _ready() -> void:
	numberOfSequence = 0
	changeSequence()

func changeSequence() -> void:
	sequence = allSequences[RandomNumberGenerator.new().randi_range(0, allSequences.size()-1)]
	txt_info.text = ""
	for c in sequence:
		txt_info.text += c

@export var txt : Label
@export var txt_info : Label
var numberOfSequence : int
@export var maxNumberofSequence : int

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.as_text_keycode() == sequence[sequence_index]:
			txt.text += event.as_text()
			type.play()
			sequence_index += 1
			if sequence_index == sequence.size():
				numberOfSequence+=1
				if numberOfSequence == maxNumberofSequence:
					EventBus.on_challenge_completed.emit()
				txt.text = ""
				sequence_index = 0
				changeSequence()
