extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()

	# Vuelve al inicio cuando sale por la derecha de la pantalla
	var screen_width = get_viewport_rect().size.x
	if position.x > screen_width + 50:
		position.x = -50
