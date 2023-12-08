extends Node2D

func _on_start_button_pressed():
	ClientSide.ConnectToServer("127.0.0.1",4000, $Panel/Username.text)
	
func loadGame():
	get_tree().change_scene_to_file("res://board.tscn")
