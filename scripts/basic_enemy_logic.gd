extends CharacterBody2D

@export var CurrentState:String = "Idle"

@onready var Raycast := %Raycast

var DesiredVelocity:Vector2
var MoveVelocity:Vector2
var ExternalVelocity:Vector2

var HP:float = 5
var SPEED:float = 200

@onready var NavAgent:NavigationAgent2D = %Navigation

func _physics_process(delta: float) -> void:
	if(HP <= 0):
		AnimationGlobals.animated_free(self)
		return
	EnemyGlobals.raycast_logic(self, Raycast)
	if(CurrentState == "Chasing"):
		MoveVelocity = EnemyGlobals.chase_velocity(self, NavAgent, 100)
	else:
		MoveVelocity = Vector2.ZERO
	velocity_logic()
	return

func velocity_logic():
	DesiredVelocity = MoveVelocity + ExternalVelocity
	velocity = DesiredVelocity
	move_and_slide()
	return
