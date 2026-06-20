extends Node2D

const SPEED = 150.0

func _process(delta: float) -> void:
	position.y += SPEED * delta

	# Al salir por abajo vuelve por arriba
	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		position.y = -50
