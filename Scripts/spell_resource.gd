extends Resource

class_name SpellResource



@export var name:String
@export var damage:int
@export var damageType:SPELL_ATTRIBUTES.DAMAGE_TYPE
@export var shapeType:SPELL_ATTRIBUTES.SHAPE_TYPE
@export var radius:int
@export var shapeActivaton:SPELL_ATTRIBUTES.SHAPE_ACTIVATION
@export var range:int


@export var cooldown:float
@export var manaCost:int

@export var modifiers:Dictionary =  {
	SPELL_ATTRIBUTES.MODIFIER_TYPE.DAMAGE: 0,
	SPELL_ATTRIBUTES.MODIFIER_TYPE.RADIUS: 0,
	SPELL_ATTRIBUTES.MODIFIER_TYPE.COOLDOWN: 0
}

func addModifiers(s_modifiers):
	for modifierPair in s_modifiers:
		modifiers[modifierPair[0]] = modifierPair[1]

func _init(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_shapeActivation, s_range, s_modifiers = [], s_cooldown = 0):
	addModifiers(s_modifiers)
	name = s_name
	damage = s_damage
	damageType = s_damageType
	radius = s_radius
	shapeType = s_shapeType
	shapeActivaton = s_shapeActivation
	range = s_range
	
	cooldown = s_cooldown
	#Calculate mana cost
	manaCost = 10 #Should be calculated
