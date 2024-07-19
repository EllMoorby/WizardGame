extends Shape

class_name Bolt

@onready var projectile = preload("res://Scenes/Bolt.tscn")

func Use():
	var activeProjectile = projectile.new()
	parent.add_child(activeProjectile)
