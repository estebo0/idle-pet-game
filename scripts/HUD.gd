extends CanvasLayer

@onready var coin_label: Label = $CoinLabel

func _ready() -> void:
	GameManager.coins_changed.connect(_on_coins_changed)
	coin_label.text = "🪙 0"

func _on_coins_changed(total: int) -> void:
	coin_label.text = "🪙 %d" % total
