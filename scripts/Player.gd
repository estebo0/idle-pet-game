extends Node2D

const SPEED = 150.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	_setup_animations()
	anim.play("walk_down")

func _process(delta: float) -> void:
	position.y += SPEED * delta

	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height + 50:
		position.y = -50

func _setup_animations() -> void:
	var frames = SpriteFrames.new()

	# Walk Down
	frames.add_animation("walk_down")
	frames.set_animation_speed("walk_down", 8)
	frames.set_animation_loop("walk_down", true)
	for i in range(4):
		var tex = load("res://assets/sprites/CharacterAnimation/WalkDown/Untitled-2_%d.png" % i)
		frames.add_frame("walk_down", tex)

	# Idle
	frames.add_animation("idle")
	frames.set_animation_speed("idle", 4)
	frames.set_animation_loop("idle", true)
	for i in range(4):
		var tex = load("res://assets/sprites/CharacterAnimation/Idle/Untitled-0_%d.png" % i)
		frames.add_frame("idle", tex)

	anim.sprite_frames = frames
