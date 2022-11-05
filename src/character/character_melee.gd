extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var weapon = $Weapon

# Called when the node enters the scene tree for the first time.
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("attack_right"):
		weapon.attack()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
