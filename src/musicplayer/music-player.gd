extends Node

onready var tweenOut = get_node("Tween")
export var transition_duration = 1.00
export var transition_type = 1

var menu = load("res://assets/music/Title_Theme.mp3")
var intro = load("res://musicplayer/Seatbelts - Ask DNA.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func fade_out():
	tweenOut.interpolate_property($test, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tweenOut.start()

func _on_TweenOut_completed(object):
	# stop the music -- otherwise it continues to run at silent volume
	object.stop()
	object.volume_db = 0

func menu():
	if $test.stream == menu and $test.playing:
		pass
	else:
		$test.stream = menu
		$test.play()

func intro():
	if $test.stream == intro and $test.playing:
		pass
	else: 
		$test.stream = intro
		$test.play()
	
