extends Node

class_name Shape

var parent:Node2D
var size:int

func _init(s_parent, s_size):
	parent = s_parent
	size = s_size
	Start()
	
func Start():
	pass
	
func OnUse():
	pass
	
func CreateCollider():
	pass
	
	
