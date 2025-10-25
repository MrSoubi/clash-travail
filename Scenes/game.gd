extends Node

@export var challenges : Array[Node]
@export var employee_zone : Control
@export var boss_zone : Control

func change_challenge():
	var challenge_boss = challenges[randi_range(0,challenges.size())]
	var challenge_employee = challenges[randi_range(0,challenges.size())]
