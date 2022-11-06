extends KinematicBody2D


onready var animatedSprite = $CharacterSprite

var velocity = Vector2(0,0)
var hp = 6
const speed_increase = 18
const max_speed = 50
const gravity = 5
const jump = -200
	

func _physics_process(_delta):
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed_increase
		animatedSprite.play("run")
	elif Input.is_action_pressed("move_left"):
		velocity.x += -speed_increase
		animatedSprite.play("run")
	else:
		animatedSprite.play("idle")
	
	if velocity.y < 500:
		velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
		animatedSprite.play("jump")
	
	
	if velocity.y < 0 and velocity.y > -100:
		animatedSprite.play("flip")
	elif not is_on_floor() and velocity.y <= 0:
		animatedSprite.play("jump")
	elif not is_on_floor() and velocity.y > 0:
		animatedSprite.play("fall")
		
	if is_on_wall() and (Input.is_action_pressed("move_right") 
	or Input.is_action_pressed("move_left")):
		velocity.y = velocity.y * 0.8
		animatedSprite.play("slide")
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	if is_on_wall() and Input.is_action_pressed("move_right"):
		animatedSprite.flip_h = false
	elif is_on_wall() and Input.is_action_pressed("move_left"):
		animatedSprite.flip_h = true
	elif velocity.x < 0:
		animatedSprite.flip_h = true
	else:
		animatedSprite.flip_h = false
	
onready var weapon = $Weapon

# Called when the node enters the scene tree for the first time.
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("attack_right"):
		weapon.attack()
	elif event.is_action_pressed("attack_left"):
		weapon.attack1()
	elif event.is_action_pressed("attack_down"):
		weapon.attack2()
		
signal death_screen

func damage():
	if hp > 1:
		hp -= 1
	else:
		queue_free()
		
func die():
	print("yo mama")

		
func handle_hit():
	if hp > 1:
		hp -= 1
	else:
		print("You Died")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_body_entered(body):
	print("pee")
	if hp > 1:
		hp -= 1
	else:
		print("poop")
	
