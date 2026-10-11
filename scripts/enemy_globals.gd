extends Node

enum EnemyState {
	Idle,
	Chasing,
}

func raycast_logic(Raycast:RayCast2D, CurrentState):
	var Player:Node2D
	for i in get_tree().current_scene.get_children():
		if(i.is_in_group("Player")):
			Player = i
	if(Player == null):
#		print("Player isnt found")
		return
	Raycast.look_at(Player.position)
	if(Raycast.is_colliding() == false):
		return
	if(Raycast.get_collider().is_in_group("Wall")):
		return
	CurrentState = EnemyState.Chasing
#	print("Chasing player")
	return

func chase_velocity(Self_n:Node2D,NavAgent:NavigationAgent2D, speed) -> Vector2:
	var Player:Node2D
	for i in get_tree().current_scene.get_children():
		if(i.is_in_group("Player")):
			Player = i
	if(Player == null):
		return Vector2.ZERO
	NavAgent.target_position = Player.position
	if(NavAgent.is_navigation_finished() == false):
		var direction = Self_n.global_position.direction_to(NavAgent.get_next_path_position())
		return direction * speed
	return Vector2.ZERO
