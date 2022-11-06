extends KinematicBody2D

var enemy_hp = 2

onready var animatedSprite = $Bird_Hurt_Animation

func handle_hit():
	if enemy_hp > 1:
		animatedSprite.play("hit")
		enemy_hp -= 1
	
	else:
		queue_free()
		
onready var player = get_node("/root/World/Character")
		
var velocity = Vector2(0,0)
const max_speed = 100
	

func _physics_process(_delta):
	if player:
		var direction = (player.position - position).normalized()
			
		move_and_slide(direction * max_speed)
		
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "Character":
				player.damage()
