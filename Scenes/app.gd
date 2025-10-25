extends Node

@export var Game : Control
@export var MainMenu : Control
@export var BossWin : Control
@export var EmployeeWin : Control

func _ready() -> void:
	displayMainMenu()
	EventBus.on_boss_burned_out.connect(displayBossWin)
	EventBus.on_employee_burned_out.connect(displayEmployeeWin)

func displayBossWin():
	Game.visible = false
	Game.set_process(false)
	BossWin.visible = true
	BossWin.set_process(true)
	EventBus.reset_stress.emit()

func displayEmployeeWin():
	Game.visible = false
	Game.set_process(false)
	EmployeeWin.visible = true
	EmployeeWin.set_process(true)
	EventBus.reset_stress.emit()

func displayMainMenu():
	Game.set_process(false)
	BossWin.set_process(false)
	EmployeeWin.set_process(false)
	MainMenu.set_process(true)
	
	Game.visible = false
	BossWin.visible = false
	EmployeeWin.visible = false
	MainMenu.visible = true
