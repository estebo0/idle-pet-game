extends Node2D

const TREE_COUNT = 8
const TILESET = preload("res://assets/sprites/PokemonLike.png")

# Región del árbol en el tileset (32x48px = 2x3 tiles de 16px)
const TREE_REGION = Rect2(16, 384, 32, 48)

func _ready() -> void:
	var screen = get_viewport_rect().size
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	for i in range(TREE_COUNT):
		var tree = Sprite2D.new()
		var atlas = AtlasTexture.new()
		atlas.atlas = TILESET
		atlas.region = TREE_REGION
		tree.texture = atlas
		tree.scale = Vector2(2, 2)
		tree.centered = true

		# Lado izquierdo o derecho aleatoriamente
		if rng.randi() % 2 == 0:
			tree.position.x = rng.randf_range(30, 70)
		else:
			tree.position.x = rng.randf_range(screen.x - 70, screen.x - 30)

		tree.position.y = rng.randf_range(80, screen.y - 80)
		add_child(tree)
