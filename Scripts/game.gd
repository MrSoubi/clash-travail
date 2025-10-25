extends Node

@export var challenges_boss : Array[PackedScene]
@export var challenges_employee : Array[PackedScene]
@export var employee_destress_game : PackedScene
@export var boss_destress_game : PackedScene
@export var employee_zone : Control
@export var boss_zone : Control

@export var stress_rate : float = 1

var current_challenge_boss : Node
var current_challenge_employee : Node

var is_boss_working : bool
var boss_challenge_index : int
var employee_challenge_index : int

func _ready() -> void:
	is_boss_working = true
	next_challenge()
	EventBus.on_challenge_completed.connect(next_challenge)

func _process(delta: float) -> void:
	if is_boss_working:
		EventBus.add_stress_to_boss.emit(stress_rate * delta)
	else:
		EventBus.add_stress_to_employee.emit(stress_rate * delta)
	
func next_challenge():
	if is_boss_working:
		load_boss_challenge(boss_challenge_index)
		boss_challenge_index += 1
		boss_challenge_index = boss_challenge_index % challenges_boss.size()
	else:
		load_employee_challenge(employee_challenge_index)
		employee_challenge_index += 1
		employee_challenge_index = employee_challenge_index % challenges_employee.size()
		
func load_employee_challenge(index : int):
	if current_challenge_employee != null:
		current_challenge_employee.queue_free()
	
	current_challenge_employee = challenges_employee[index].instantiate()
	employee_zone.add_child(current_challenge_employee)

func load_boss_challenge(index : int):
	if current_challenge_boss != null:
		current_challenge_boss.queue_free()
		
	current_challenge_boss = challenges_boss[index].instantiate()
	boss_zone.add_child(current_challenge_boss)
