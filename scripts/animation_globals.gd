extends Node

func animated_free(Self_n:Node2D):
	var DeathAnimation:CPUParticles2D
	for i in Self_n.get_children():
		if(i.is_in_group("DeathAnimation") == false):
			i.queue_free()
		else:
			DeathAnimation = i
	DeathAnimation.emitting = true
	await DeathAnimation.finished
	Self_n.queue_free()
