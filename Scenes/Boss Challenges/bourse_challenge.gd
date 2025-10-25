extends Control

@export var buy_button : Button
@export var sell_button : Button

@export var info : Label

@export var settings_positive : LabelSettings
@export var settings_negative : LabelSettings
@export var correct_response_objective : int

var is_positive : bool
var correct_response : int = 0

func _ready() -> void:
	buy_button.pressed.connect(buy)
	sell_button.pressed.connect(sell)
	next()

func buy():
	if is_positive:
		win()
	else:
		loose()

func sell():
	if is_positive:
		loose()
	else:
		win()

func win():
	correct_response += 1
	if correct_response == correct_response_objective :
		EventBus.on_challenge_completed.emit()
	next()

func loose():
	next()

func next():
	var value = randf_range(-12, 12)
	info.text = str(snappedf(value, 0.5)) + "%"
	if value > 0:
		info.label_settings = settings_positive
		is_positive = true
	else:
		is_positive = false
		info.label_settings = settings_negative
		buy_button.pressed.connect(loose)
		sell_button.pressed.connect(win)
