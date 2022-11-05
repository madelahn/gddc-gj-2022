extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://main-menu/main-menu.tscn")



func _on_VolumeSlider_value_changed(value):
	if value == -48:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -100)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

