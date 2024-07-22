extends Area2D
class_name BoltProjectile
var speed:int = 200
var dirVector:Vector2
var maxDistance:int = 100
var currentDistanceVector = Vector2.ZERO
var startPos:Vector2

const projectile = preload("res://Scenes/Bolt.tscn")

static func fire(start:Vector2, dir:Vector2):
	var activeProjectile = projectile.instantiate()
	activeProjectile.startPos = start
	activeProjectile.rotation = (start-dir).angle() 
	activeProjectile.dirVector = (dir - start).normalized()
	activeProjectile.position = activeProjectile.startPos
	return activeProjectile
	
func die():
	queue_free()

func _physics_process(delta):
	if startPos.distance_to(currentDistanceVector) > maxDistance:
		die()
		
	var movement = dirVector * delta * speed
	self.position += movement
	self.currentDistanceVector += movement
