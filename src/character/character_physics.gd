extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var screen_size
var velocity = Vector2(0,0)
var speed = 5
var gravity = 25
var jump = -100
var max_down = 100
var max_side = 50

func _ready():
	screen_size = get_viewport_rect().size
	

func _physics_process(_delta):
	if Input.is_action_pressed("move_right") and velocity.x < 40:
		velocity.x += speed
	if Input.is_action_pressed("move_left") and velocity.x > -40:
		velocity.x = -speed
		
	if velocity.y < max_down:
		velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
	
	if Input.is_action_pressed("shoot") and get_node("character_weapon").has_bullets():
		velocity.y = 0
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	if velocity.x < 0:
		$sprite.flip_h = true
	else:
		$sprite.flip_h = false
		
	position.x = clamp(position.x, 0, 600)
	position.y = clamp(position.y, 0, screen_size.y)

	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
