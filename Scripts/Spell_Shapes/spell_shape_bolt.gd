extends Shape

class_name BoltSpell



func onUse():
	parent.get_node("../ProjectileContainer").add_child(BoltProjectile.fire(parent.global_position, parent.target))
