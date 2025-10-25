extends Node

@export var stress_bar_employee : ProgressBar
@export var stress_bar_boss : ProgressBar

var stress_employee : float = 0
var stress_boss : float = 0

func _ready() -> void:
	EventBus.add_stress_to_boss.connect(add_stress_boss)
	EventBus.add_stress_to_employee.connect(add_stress_employee)
	EventBus.reset_stress.connect(reset_stress)

func reset_stress():
	stress_employee = 0
	stress_boss = 0

func add_stress_employee(amount : float):
	stress_employee += amount
	if stress_employee >= 100:
		stress_employee = 100
		EventBus.on_employee_burned_out.emit()
	stress_bar_employee.value = stress_employee

func add_stress_boss(amount : float):
	stress_boss += amount
	if stress_boss >= 100:
		stress_boss = 100
		EventBus.on_boss_burned_out.emit()
	stress_bar_boss.value = stress_boss
