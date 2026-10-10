extends CharacterBody2D

var Desired_velocity:Vector2
var Movement_velocity:Vector2
var External_velocity:Vector2

var SPEED = 150

func _physics_process(delta: float) -> void:
	movement_logic()
	velocity_logic()
	return

func movement_logic():
	var direction = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	Movement_velocity = direction * SPEED

func velocity_logic():
	Desired_velocity = Movement_velocity + External_velocity
	self.velocity = Desired_velocity
	move_and_slide()

