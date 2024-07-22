extends Area2D
class_name BoltProjectile
var speed:int = 200
var dirVector:Vector2
var maxDistance:int = 100
var currentDistanceVector:Vector2
var startPos:Vector2
var shapeRef:BoltSpell

const projectile = preload("res://Scenes/Bolt.tscn")

static func fire(start:Vector2, dir:Vector2, p_shapeRef:BoltSpell):
	var activeProjectile = projectile.instantiate()
	activeProjectile.shapeRef = p_shapeRef
	activeProjectile.startPos = start
	activeProjectile.rotation = (start-dir).angle() 
	activeProjectile.dirVector = (dir - start).normalized()
	activeProjectile.currentDistanceVector = activeProjectile.startPos
	activeProjectile.position = activeProjectile.startPos
	return activeProjectile
	
func die():
	queue_free()
	
func onHit(body:Node2D):
	shapeRef.onHit(body)
	die()

func _physics_process(delta):
	if startPos.distance_to(currentDistanceVector) > maxDistance:
		die()
		
	var movement = dirVector * delta * speed
	self.position += movement
	self.currentDistanceVector += movement



func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		onHit(area)

