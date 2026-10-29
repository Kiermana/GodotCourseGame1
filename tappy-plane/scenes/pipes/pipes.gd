class_name Pipes

extends Node2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var scroll_speed: float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= scroll_speed * delta

func _onscreen_exited() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_laser_body_entered(_body: Node2D) -> void:
	print("Hit laser")
	audio_stream_player.play()
	ScoreManager.add_point()
