extends KinematicBody2D

var enemy_hp = 5

func handle_hit():
	if enemy_hp > 1:
		enemy_hp -= 1
	else:
		queue_free()
