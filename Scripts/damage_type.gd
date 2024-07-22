extends Node

class_name Damage_Type

var damage:int

func _init(s_damage = 0):
	damage = s_damage
	pass
	
func onHit(body:Node2D):
	body.takeDamage(damage)
	
func onTick():
	pass
	
