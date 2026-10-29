class_name Tappy

extends CharacterBody2D

const jump_force: float = -350.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly"):
		animation_player.play("fly")
		_jumped = true
		
func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped == true:
		velocity.y = jump_force
		_jumped = false
	
	move_and_slide()
	if is_on_floor():
		die()

func die():
	SignalHub.emit_tappy_died()
	get_tree().paused = true
