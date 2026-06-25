extends Node2D

func _ready() -> void:
	$BackButton.pressed.connect(_on_back_pressed)
	$VBoxContainer/Dungeon1.pressed.connect(_on_dungeon1_pressed)
	$VBoxContainer/Dungeon2.pressed.connect(_on_dungeon2_pressed)
	$VBoxContainer/Dungeon3.pressed.connect(_on_dungeon3_pressed)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Lobby.tscn")

func _on_dungeon1_pressed() -> void:
	GameManager.current_difficulty = 1
	get_tree().change_scene_to_file("res://scenes/Dungeon.tscn")

func _on_dungeon2_pressed() -> void:
	GameManager.current_difficulty = 2
	get_tree().change_scene_to_file("res://scenes/Dungeon.tscn")

func _on_dungeon3_pressed() -> void:
	GameManager.current_difficulty = 3
	get_tree().change_scene_to_file("res://scenes/Dungeon.tscn")
