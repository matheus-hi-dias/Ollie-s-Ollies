extends Node


func _ready():
	SilentWolf.configure({
		"api_key": "9PAbIQD1Fc7FRIk3qgNMKCFT1pmOZ7TsZlDNkvg0",
		"game_id": "Ollies_Ollies" ,
		"game_version": "1.0.0",
		"log_level": 2
	})
	
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/StartMenu.tscn"
	})
