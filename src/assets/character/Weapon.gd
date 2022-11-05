extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func attack():
	anim.play("stab")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Weapon_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
