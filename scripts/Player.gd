extends Node2D

const SPEED = 150.0

var lobby_mode: bool = false

func _ready() -> void:
	if get_parent().name == "Lobby":
		lobby_mode = true

func _process(delta: float) -> void:
	if lobby_mode:
		return

	position.y += SPEED * delta

	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		position.y = -50
