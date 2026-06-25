extends Node2D

func _ready() -> void:
	$EnterButton.pressed.connect(_on_enter_pressed)

func _on_enter_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/World.tscn")
