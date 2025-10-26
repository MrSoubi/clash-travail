extends Node

@export var stress_bar_employee : ProgressBar
@export var stress_bar_boss : ProgressBar
@export var stress_bar_boss_style : StyleBoxFlat
@export var stress_bar_employee_style : StyleBoxFlat

var stress_employee : float = 0
var stress_boss : float = 0
var is_stress_running : bool

func _ready() -> void:
	EventBus.add_stress_to_boss.connect(add_stress_boss)
	EventBus.add_stress_to_employee.connect(add_stress_employee)
	EventBus.reset_stress.connect(reset_stress)
	EventBus.pause_stress.connect(pause_stress)
	EventBus.run_stress.connect(run_stress)

func pause_stress():
	is_stress_running = false

func run_stress():
	is_stress_running = true

func reset_stress():
	stress_employee = 0
	stress_boss = 0

func add_stress_employee(amount : float):
	if not is_stress_running:
		return
	
	if amount > 0:
		stress_bar_employee_style.bg_color = Color.RED
	else:
		stress_bar_employee_style.bg_color = Color.GREEN
	
	stress_employee += amount
	if stress_employee >= 100:
		stress_employee = 100
		EventBus.on_employee_burned_out.emit()
	stress_bar_employee.value = stress_employee

func add_stress_boss(amount : float):
	if not is_stress_running:
		return
	
	stress_boss += amount
	
	if amount > 0:
		stress_bar_boss_style.bg_color = Color.RED
	else:
		stress_bar_boss_style.bg_color = Color.GREEN
	
	if stress_boss >= 100:
		stress_boss = 100
		EventBus.on_boss_burned_out.emit()
	stress_bar_boss.value = stress_boss
