extends Node2D

const SPEED = 150.0

var lobby_mode: bool = false
var joystick_dir: Vector2 = Vector2.ZERO

func _ready() -> void:
	if get_parent().name == "Lobby":
		lobby_mode = true

func set_joystick_direction(dir: Vector2) -> void:
	joystick_dir = dir

func _process(delta: float) -> void:
	# Teclado
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1

	# Joystick táctil (tiene prioridad si se está usando)
	if joystick_dir.length() > 0.1:
		dir = joystick_dir

	if dir.length() > 0:
		position += dir.normalized() * SPEED * delta

	if lobby_mode:
		var screen = get_viewport_rect().size
		position.x = clamp(position.x, 20, screen.x - 20)
		position.y = clamp(position.y, 20, screen.y - 20)
