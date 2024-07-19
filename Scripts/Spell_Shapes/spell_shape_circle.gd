extends Shape

class_name Circle

var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	parent.add_child(collisionShape)
	collisionShape.shape = CircleShape2D.new()
	collisionShape.shape.set_radius(size)
	
func Use():
	#Deal Damage
	pass
	
