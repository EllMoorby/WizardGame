extends Resource

class_name SpellResource



@export var name:String
@export var damage:int
@export var damageType:SPELL_ATTRIBUTES.DAMAGE_TYPE
@export var shapeType:SPELL_ATTRIBUTES.SHAPE_TYPE
@export var radius:int

@export var cooldown:float
@export var manaCost:int

func _init(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_cooldown = 0, s_manaCost = 0):
	name = s_name
	damage = s_damage
	damageType = s_damageType
	radius = s_radius
	shapeType = s_shapeType
	
	cooldown = s_cooldown
	manaCost = s_manaCost
