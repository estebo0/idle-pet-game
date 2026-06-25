extends Node2D

const SPEED = 150.0

var lobby_mode: bool = false

func _ready() -> void:
	if get_parent().name == "Lobby":
		lobby_mode = true

func _process(delta: float) -> void:
	if lobby_mode:
		_handle_manual_movement(delta)
	else:
		_handle_auto_movement(delta)

func _handle_manual_movement(delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1

	if dir.length() > 0:
		position += dir.normalized() * SPEED * delta

	# Mantener al jugador dentro de la pantalla
	var screen = get_viewport_rect().size
	position.x = clamp(position.x, 20, screen.x - 20)
	position.y = clamp(position.y, 20, screen.y - 20)

func _handle_auto_movement(delta: float) -> void:
	position.y += SPEED * delta

	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		position.y = -50
