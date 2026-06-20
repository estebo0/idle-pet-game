extends Node2D

const SPEED = 150.0

func _process(delta: float) -> void:
	position.x += SPEED * delta

	# Al salir por la derecha vuelve por la izquierda
	var screen_width = get_viewport_rect().size.x
	if position.x > screen_width + 50:
		position.x = -50
