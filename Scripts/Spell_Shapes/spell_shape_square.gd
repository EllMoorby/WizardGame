extends Shape

class_name SquareSpell
	
var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	collisionShape.shape = RectangleShape2D.new()
	collisionShape.shape.set_size(Vector2 (size*2,size*2))
	parent.add_child(collisionShape)
	
func onUse():
	for area in parent.get_overlapping_areas():
		if area.is_in_group("Enemy"):
			onHit(area)
	
func onHit(body:Node2D):
	body.takeDamage(parent.attributes.damage)
	
func setTarget(target:Vector2):
	collisionShape.global_position = target

