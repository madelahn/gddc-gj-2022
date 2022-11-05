extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_bullets = 0
var bullets = 0
var gun_type = "gun1"
var time = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	if gun_type == "gun1":
		max_bullets = 6
		bullets = 6
	elif gun_type == "gun2":
		max_bullets = 2
		bullets = 2
	elif gun_type == "gun3":
		max_bullets = 25
		bullets = 25
	
func has_bullets():
	if bullets == 0:
		return false
	else:
		return true
	
func gun_function(_delta):
	time += 1
	if time == 60 and bullets < max_bullets:
		bullets += 1
	
	if Input.is_action_pressed("shoot") and has_bullets():
		bullets -= 1
	

	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
