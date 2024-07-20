extends Area2D
class_name BoltProjectile
var speed:int = 200
var dirVector:Vector2

const projectile = preload("res://Scenes/Bolt.tscn")

static func fire(start:Vector2, dir:Vector2):
	var activeProjectile = projectile.instantiate()
	activeProjectile.rotation = (start-dir).angle() 
	activeProjectile.dirVector = (dir - start).normalized() * 300
	activeProjectile.position = start
	return activeProjectile
	

func _physics_process(delta):
	
	self.position += dirVector * delta
