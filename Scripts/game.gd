extends Node

@export var challenges_boss : Array[PackedScene]
@export var challenges_employee : Array[PackedScene]
@export var employee_destress_game : PackedScene
@export var boss_destress_game : PackedScene
@export var employee_zone : Control
@export var boss_zone : Control
@export var boss_instructions : Array[PackedScene]
@export var employee_instructions : Array[PackedScene]
@export var stress_rate : float = 1

var current_challenge_boss : Node
var current_challenge_employee : Node

var is_boss_working : bool
var boss_challenge_index : int
var employee_challenge_index : int

func _ready() -> void:
	is_boss_working = false
	next_challenge()
	EventBus.on_challenge_completed.connect(next_challenge)

func _process(delta: float) -> void:
	if is_boss_working:
		EventBus.add_stress_to_boss.emit(stress_rate * delta)
	else:
		EventBus.add_stress_to_employee.emit(stress_rate * delta)
	
func next_challenge():
	EventBus.pause_stress.emit()
	is_boss_working = !is_boss_working
	
	if current_challenge_employee != null:
		current_challenge_employee.queue_free()
	
	if current_challenge_boss != null:
		current_challenge_boss.queue_free()
	
	if is_boss_working:
		await play_boss_instructions(boss_challenge_index)
		load_boss_challenge(boss_challenge_index)
		EventBus.run_stress.emit()
		boss_challenge_index += 1
		boss_challenge_index = boss_challenge_index % challenges_boss.size()
	else:
		await play_employee_instructions(employee_challenge_index)
		load_employee_challenge(employee_challenge_index)
		EventBus.run_stress.emit()
		employee_challenge_index += 1
		employee_challenge_index = employee_challenge_index % challenges_employee.size()
		
func load_employee_challenge(index : int):
	current_challenge_employee = challenges_employee[index].instantiate()
	employee_zone.add_child(current_challenge_employee)
	
	current_challenge_boss = boss_destress_game.instantiate()
	boss_zone.add_child(current_challenge_boss)

func load_boss_challenge(index : int):
	current_challenge_boss = challenges_boss[index].instantiate()
	boss_zone.add_child(current_challenge_boss)
	
	current_challenge_employee = employee_destress_game.instantiate()
	employee_zone.add_child(current_challenge_employee)

func play_boss_instructions(index):
	var instructions = boss_instructions[0].instantiate()
	add_child(instructions)
	await instructions.tree_exited
	
func play_employee_instructions(index):
	var instructions = employee_instructions[0].instantiate()
	add_child(instructions)
	await instructions.tree_exited
