extends Node

@export var ambiance_employee : AudioStreamPlayer
@export var ambiance_boss : AudioStreamPlayer

func _ready() -> void:
	ambiance_boss.play()
	ambiance_employee.play()
	set_ambiance_ratio(0.5)
	EventBus.boss_working.connect(on_boss_working)
	
### Une valeur de 1 jouera l'ambiance du patron à fond, une ambiance de 0 jouera l'ambiance de la plage à fond. Entre les deux c'est un mix.
func set_ambiance_ratio(ratio : float):
	ambiance_boss.volume_linear = ratio
	ambiance_employee.volume_linear = 1 - ratio

func on_boss_working(is_boss_working):
	if is_boss_working:
		set_ambiance_ratio(1)
	else:
		set_ambiance_ratio(0)
