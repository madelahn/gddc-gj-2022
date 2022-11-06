extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/character/Character")
	
func _process(delta):
	position.x = player.position.x
	position.y = player.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
