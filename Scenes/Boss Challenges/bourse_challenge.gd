extends Control

@export var bourse1 : Sprite2D
@export var bourse2 : Sprite2D
@export var boutonA : Sprite2D
@export var boutonB : Sprite2D

@export var button : Button

@export var settings_positive : LabelSettings
@export var settings_negative : LabelSettings

@export var sfx_good : AudioStreamPlayer

func _ready() -> void:
	button.visible = true
	boutonA.visible = true
	boutonB.visible = false
	bourse1.visible = true
	bourse2.visible = false

func _on_button_pressed() -> void:
	sfx_good.play()
	EventBus.add_stress_to_boss.emit(-0.75)
	bourse1.visible = false
	boutonA.visible = false
	boutonB.visible = true
	bourse2.visible = true
	button.visible = false
	await get_tree().create_timer(0.2).timeout
	button.visible = true
	boutonA.visible = true
	boutonB.visible = false
	bourse1.visible = true
	bourse2.visible = false
