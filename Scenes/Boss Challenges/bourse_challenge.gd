extends Control

@export var buy_button : Button

@export var info : Label

@export var settings_positive : LabelSettings
@export var settings_negative : LabelSettings

@export var sfx_good : AudioStreamPlayer

func _ready() -> void:
	buy_button.pressed.connect(buy)
	next()

func buy():
	sfx_good.play()
	buy_button.visible = false
	await get_tree().create_timer(0.5).timeout
	buy_button.visible = true
	next()

func next():
	var value = randf_range(-12, 12)
	info.text = str(snappedf(value, 0.5)) + "%"
	if value > 0:
		info.label_settings = settings_positive
	else:
		info.label_settings = settings_negative
