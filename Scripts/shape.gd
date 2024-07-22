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
	
func onUse():
	pass
	
func onHit(body:Node2D):
	pass
	
func _process(delta):
	pass
	
func CreateCollider():
	pass
	
func setTarget(target:Vector2):
	pass
	
