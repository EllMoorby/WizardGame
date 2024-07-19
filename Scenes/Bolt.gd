extends Area2D
var speed:int = 200
var dirVector:Vector2

func _init(dir):
	self.look_at(dir)
	dirVector = (dir - self.global_position).normalized() * 300

func _physics_process(delta):
	self.global_position += dirVector * delta
