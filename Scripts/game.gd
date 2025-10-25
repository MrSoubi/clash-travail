extends Node

@export var challenges_boss : Array[PackedScene]
@export var challenges_employee : Array[PackedScene]

@export var employee_zone : Control
@export var boss_zone : Control

var last_employee_challenge : PackedScene = null
var last_boss_challenge : PackedScene = null

func _ready() -> void:
	change_challenge()

func change_challenge():
	var challenge_boss = challenges_boss[randi_range(0,challenges_boss.size() - 1)]
	var challenge_employee = challenges_employee[randi_range(0,challenges_employee.size() - 1)]
	
	while (challenge_boss == last_boss_challenge or challenge_employee == last_employee_challenge):
		challenge_boss = challenges_boss[randi_range(0,challenges_boss.size() - 1)]
		challenge_employee = challenges_employee[randi_range(0,challenges_employee.size() - 1)]
	
	var new_challenge_boss = challenge_boss.instantiate()
	var new_challenge_employee = challenge_employee.instantiate()
	
	boss_zone.add_child(new_challenge_boss)
	employee_zone.add_child(new_challenge_employee)
