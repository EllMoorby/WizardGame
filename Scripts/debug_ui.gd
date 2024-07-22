extends CanvasLayer

class_name DebugUI
@onready var healthLabel = $Health

func updateHealth(health):
	healthLabel.text = str("Health: ",health)

func _on_player_health_update(health):
	updateHealth(health)
