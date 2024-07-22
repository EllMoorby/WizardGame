extends Damage_Type

class_name Damage_Type_Fire

func onHit(body:Node2D):
	print("Deals Fire Damage")
	body.takeDamage(damage)
	
