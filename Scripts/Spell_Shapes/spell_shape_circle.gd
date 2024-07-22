extends Shape

class_name CircleSpell

var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	collisionShape.shape = CircleShape2D.new()
	collisionShape.shape.set_radius(size)
	parent.add_child(collisionShape)
	
func onUse():
	for area in parent.get_overlapping_areas():
		if area.is_in_group("Enemy"):
			onHit(area)
			
	
func setTarget(target:Vector2):
	collisionShape.global_position = target

	
