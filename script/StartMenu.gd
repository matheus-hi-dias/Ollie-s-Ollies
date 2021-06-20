extends Control

func _ready():
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_RankingButton_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
