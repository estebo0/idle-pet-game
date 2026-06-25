extends Node2D

@export var difficulty: int = 1

func _ready() -> void:
	$EnemySpawner.difficulty = difficulty
	$HUD/BackButton.pressed.connect(_on_back_pressed)
	GameManager.coins_changed.connect(_on_coins_changed)
	$HUD/CoinLabel.text = "🪙 %d" % GameManager.coins

func _on_coins_changed(total: int) -> void:
	$HUD/CoinLabel.text = "🪙 %d" % total

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Lobby.tscn")
