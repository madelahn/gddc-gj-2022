extends Node2D

var timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_SettingsButton_pressed():
	get_tree().change_scene("res://main-menu/settings.tscn")


func _on_StartButton_pressed():
	timer.connect("timeout", self, "_changeScene")
	timer.wait_time = 2
	timer.one_shot = true
	add_child(timer)
	
	MusicPlayer.fade_out()
	timer.start()
	


func _changeScene():
	get_tree().change_scene("res://cutscenes/intro-scene.tscn")
