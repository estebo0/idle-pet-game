extends Node2D

const SPEED = 300.0

var direction: Vector2 = Vector2.ZERO
var damage: int = 1

func _process(delta: float) -> void:
	position += direction * SPEED * delta

	# Destruir al salir de pantalla
	var screen = get_viewport_rect().size
	if position.x < -50 or position.x > screen.x + 50 or position.y < -50 or position.y > screen.y + 50:
		queue_free()
		return

	# Comprobar impacto con enemigos
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if position.distance_to(enemy.position) < 20:
			enemy.take_damage(damage)
			queue_free()
			return
