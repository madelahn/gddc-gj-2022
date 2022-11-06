extends Node

var menu = load("res://musicplayer/Seatbelts - Ask DNA.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func menu():
	if $test.stream == menu and $test.playing:
		pass
	else:
		$test.stream = menu
		$test.play()
