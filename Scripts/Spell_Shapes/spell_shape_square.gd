extends Shape

class_name Square
	
var collisionShape:CollisionShape2D

func CreateCollider():
	collisionShape = CollisionShape2D.new()
	parent.add_child(collisionShape)
	collisionShape.shape = RectangleShape2D.new()
	collisionShape.shape.set_size(Vector2 (radius*2,radius*2))
	
