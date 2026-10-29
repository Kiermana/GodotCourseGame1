extends Control

@onready var timer: Timer = $Timer
@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var sound: AudioStreamPlayer = $Sound
@onready var press_jump_label: Label = $MarginContainer/PressJumpLabel
@onready var score_label: Label = $MarginContainer/ScoreLabel
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		ComplexChange.load_main_screen()
	if event.is_action_pressed("fly") and press_jump_label.visible:
		ComplexChange.load_main_screen()


func _ready() -> void:
	SignalHub.tappy_died.connect(game_over)
	SignalHub.point_scored.connect(on_point_scored)
	on_point_scored(0)

func game_over():
	timer.start()
	sound.play()
	game_over_label.show()


func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_jump_label.show()
	print("Timer timed out")
	
func on_point_scored(score: int) -> void:
	score_label.text = "%04d" % score
