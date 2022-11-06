extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim = $Right_Weapon_Ani
onready var anim1 = $Left_Weapon_Ani
onready var anim2 = $Down_Weapon_Ani


# Called when the node enters the scene tree for the first time.
func attack():
	anim.play("stab")

func attack1():
	anim1.play("stab2")
	
func attack2():
	anim2.play("stab3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Weapon_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
