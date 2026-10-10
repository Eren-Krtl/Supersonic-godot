extends CharacterBody2D

var CurrentState = EnemyGlobals.EnemyState.Idle

@onready var Raycast = %Raycast

var DesiredVelocity:Vector2
var MoveVelocity:Vector2
var ExternalVelocity:Vector2

var HP:float = 10
var SPEED:float = 200

@onready var NavAgent:NavigationAgent2D = %Navigation

func _physics_process(delta: float) -> void:
	velocity_logic()
	raycast_logic()
	if(HP <= 0):
		self.queue_free()
	return

func velocity_logic():
	DesiredVelocity = MoveVelocity + ExternalVelocity
	velocity = DesiredVelocity
	move_and_slide()
	return

func move_logic(Player:Node2D):
	NavAgent.target_position = Player.position
	if(NavAgent.is_navigation_finished() == false):
		var direction = global_position.direction_to(NavAgent.get_next_path_position())
		MoveVelocity = direction * SPEED
	return

func raycast_logic():
	var Player:Node2D
	for i in get_tree().current_scene.get_children():
		if(i.is_in_group("Player")):
			Player = i
	if(Player == null):
		print("Player isnt found")
		return
	Raycast.look_at(Player.position)
	return
