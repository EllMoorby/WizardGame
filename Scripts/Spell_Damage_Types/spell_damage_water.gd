extends Damage_Type

class_name Damage_Type_Water

func onHit(body:Node2D):
	print("Deals Water Damage")
	body.takeDamage(damage)
