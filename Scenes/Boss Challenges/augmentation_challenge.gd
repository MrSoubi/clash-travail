extends Control

@export var sliders : Array[Node]
@export var dragAudioLoop : AudioStreamPlayer
@export var valueOKAudio : AudioStreamPlayer
@export var valueWrongAudio : AudioStreamPlayer
@export var gameFinishedAudio : AudioStreamPlayer

func _ready() -> void:
	for s in sliders:
		s.on_value_ok.connect(check_challenge)
		s.on_value_wrong.connect(play_value_wrong)
		s.on_interact.connect(play_sound)
		s.on_interact_end.connect(stop_sound)

func play_sound():
	dragAudioLoop.play()

func stop_sound():
	dragAudioLoop.stop()
	
func play_value_wrong():
	valueWrongAudio.play()

func check_challenge():
	var result : bool = true
	valueOKAudio.play()
	for s in sliders:
		result = result and s.is_value_ok
	
	if result:
		gameFinishedAudio.reparent(get_tree().root)
		gameFinishedAudio.play()
		EventBus.on_challenge_completed.emit()
