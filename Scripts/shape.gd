extends Node

class_name Shape

var parent:Node2D
var radius:int

func _init(s_parent, s_radius):
	parent = s_parent
	radius = s_radius
	print("Radius ",radius)
	CreateCollider()
	
func CreateCollider():
	pass
	
func OnUse():
	pass
	
