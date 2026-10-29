extends Node



@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
@export var pipes_scene: PackedScene
@onready var pipes_holder: Node = $PipesHolder



func _ready() -> void:
	ScoreManager.reset_score()


func _on_timer_timeout() -> void:
	spawn_pipe()


func spawn_pipe():
	var New_Pipe = pipes_scene.instantiate()
	var pos_y = randf_range(upper_spawn.position.y, lower_spawn.position.y)
	var pos_x = upper_spawn.position.x
	New_Pipe.position = Vector2(pos_x,pos_y)
	add_child(New_Pipe)
