extends KinematicBody2D

var enemy_hp = 5

onready var Zombie_hurt = $Zombie_Hurt_Animation

func handle_hit():
	if enemy_hp > 1:
		Zombie_hurt.play("hit")
		enemy_hp -= 1
	
	else:
		queue_free()
		
onready var player = get_node("/root/World/Character")
		
var velocity = Vector2(0,0)
const max_speed = 55
const gravity = 10
const jump = -200
	

func _physics_process(_delta):
	if player:
		var direction = (player.position - position).normalized()
		if not is_on_floor():
			direction.y += gravity
		elif is_on_floor() and is_on_wall():
			direction.y = jump
			
		move_and_slide(direction * max_speed)
		
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "Character":
				player.damage()
