extends Control

var maincontainerPause
onready var Main = get_parent()

func _ready():
	maincontainerPause = find_node("MainContainer")

func _process(delta):
	if get_tree().paused:
		maincontainerPause.show()
	else:
		maincontainerPause.hide()
	
func _on_RestartButton_pressed():
	Main.continue_Game()
	get_tree().change_scene("res://scenes/Main.tscn")
	
	
func _on_QuitButton_pressed():
	Main.continue_Game()
	get_tree().change_scene("res://scenes/StartMenu.tscn")
	
	
func _on_BackToGameButton_pressed():
	Main.continue_Game()
