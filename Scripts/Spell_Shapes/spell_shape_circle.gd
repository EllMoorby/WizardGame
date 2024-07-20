extends Shape

class_name CircleSpell

var collisionShape:CollisionShape2D

func Start():
	CreateCollider()
	
func CreateCollider():
	collisionShape = CollisionShape2D.new()
	parent.add_child(collisionShape)
	collisionShape.shape = CircleShape2D.new()
	collisionShape.shape.set_radius(size)
	collisionShape.set_deferred("disabled",true)
	
func onUse():
	collisionShape.set_deferred("disabled",false)
	collisionShape.global_position = parent.get_global_mouse_position()
	#Check for enemies
	collisionShape.set_deferred("disabled",true)
	
