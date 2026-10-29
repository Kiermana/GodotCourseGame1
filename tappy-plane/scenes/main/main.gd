extends Control
 
@onready var highscore: Label = $MarginContainer/Score

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly"):
		ComplexChange.load_game_screen()

func _ready() -> void:
	get_tree().paused = false
	highscore.text = "%04d" % ScoreManager.high_score
