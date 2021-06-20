extends Control

var mainContainerSave
onready var main = get_parent()

func _ready():
	mainContainerSave = find_node("MainContainer")
	pass

func _process(delta):
	if get_parent().openSaveMenu:
		mainContainerSave.show()
	else:
		mainContainerSave.hide()
	get_node("CanvasLayer/MainContainer/HBoxContainer/VBoxContainer/TextureRect/Pontos").text = str(main.pontos as int)

func _on_CancelButton_pressed():
	get_parent().openSaveMenu = false

func _on_SaveButton_pressed():
	var player_name = $"CanvasLayer/MainContainer/HBoxContainer/VBoxContainer/TextureRect/Nome".text
	SilentWolf.Scores.persist_score(player_name, main.pontos as int)
	SilentWolf.Scores.get_high_scores()
	get_parent().openSaveMenu = false
