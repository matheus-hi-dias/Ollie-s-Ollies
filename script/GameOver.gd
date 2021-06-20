extends Control

var mainContainerGameOver

func _ready():
	mainContainerGameOver = find_node("MainContainer")

func _process(delta):
	if get_parent().acabou:
		mainContainerGameOver.show()
	else:
		mainContainerGameOver.hide()

func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_QuitButton_pressed():
	get_tree().change_scene("res://scenes/StartMenu.tscn")


func _on_SaveButton_pressed():
	get_parent().openSaveMenu = true
