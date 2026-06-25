extends Node2D

var hp: int = 3

func take_damage(amount: int) -> void:
	hp -= amount
	modulate = Color(1, 0.3, 0.3)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1, 1, 1)
	if hp <= 0:
		GameManager.add_coins(1)
		queue_free()
