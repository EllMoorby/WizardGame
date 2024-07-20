extends Shape

class_name SquareSpell
	
var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	parent.add_child(collisionShape)
	collisionShape.shape = RectangleShape2D.new()
	collisionShape.shape.set_size(Vector2 (size*2,size*2))
	collisionShape.set_deferred("disabled",true)
	
func onUse():
	collisionShape.set_deferred("disabled",false)
	collisionShape.global_position = parent.get_global_mouse_position()
	#Check for enemies
	collisionShape.set_deferred("disabled",true)
	

