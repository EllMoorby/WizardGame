extends Node

class_name Shape

var radius:int

func _init(s_radius):
	radius = s_radius
	print("Radius ",radius)
	CreateCollider()
	
func CreateCollider():
	pass
	
func OnUse():
	pass
	
