extends CharacterBody2D

enum WeaponType {
	Natural,
	Bouncy,
}

@export var NormalBulletPac:PackedScene

@onready var ShootTimer:Timer = %ShootTimer

var CurrentWeapon = WeaponType.Natural

func _physics_process(delta: float) -> void:
	rotation_logic()
	return

func rotation_logic():
	look_at(get_global_mouse_position())
	return

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Shoot") && CurrentWeapon == WeaponType.Natural && ShootTimer.time_left == 0):
		create_normal_bullet()
		ShootTimer.start()

func create_normal_bullet():
	var NormalBulletPre = NormalBulletPac.instantiate()
	NormalBulletPre.rotation_degrees = self.rotation_degrees
	NormalBulletPre.global_position = %ShootPoint.global_position
	NormalBulletPre.top_level = true
	add_child(NormalBulletPre)
