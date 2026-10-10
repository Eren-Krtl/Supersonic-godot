extends CharacterBody2D

var SPEED:float = 1200

func _physics_process(delta: float) -> void:
	movement_logic()
	return

func movement_logic():
	velocity = transform.x * SPEED
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i).get_collider()
		if(collision.is_in_group("Wall")):
			print("Hit wall")
			self.queue_free()

func _on_lifespan_timeout() -> void:
	self.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Enemy")):
		print("Hit enemy")
		self.queue_free()
