extends Node

signal coins_changed(total: int)

var coins: int = 0
var current_difficulty: int = 1

func add_coins(amount: int) -> void:
	coins += amount
	coins_changed.emit(coins)
