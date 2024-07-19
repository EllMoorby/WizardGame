extends Shape

class_name Square
	
var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	parent.add_child(collisionShape)
	collisionShape.shape = RectangleShape2D.new()
	collisionShape.shape.set_size(Vector2 (size*2,size*2))
	
func Use():
	#Deal Damage
	pass
