extends CanvasLayer

class_name DebugUI
@onready var healthLabel = $Health
@onready var manaLabel = $Mana

func updateHealth(health):
	healthLabel.text = str("Health: ",health)
	
func updateMana(mana):
	manaLabel.text = str("Mana: ",mana)

func _on_player_health_update(health):
	updateHealth(health)


func _on_player_mana_update(mana):
	updateMana(mana)
