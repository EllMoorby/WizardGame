extends Area2D
class_name  Enemy

@onready var healthLabel = $Health

@export var health:int = 30
@export var damage:int = 10

func updateHealthLabel():
	healthLabel.text = str(health)

func _ready():
	updateHealthLabel()

func takeDamage(damage:int):
	health -= damage
	if health <= 0:
		die()
	updateHealthLabel()

func die():
	queue_free()

func attack(body:Node2D):
	body.takeDamage(damage)
	
func _on_body_entered(body):
	if body.is_in_group("Player") and body.has_method("takeDamage"):
		attack(body)
