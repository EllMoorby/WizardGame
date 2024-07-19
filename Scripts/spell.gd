extends Area2D
class_name Spell

var shape:Shape
@onready var collisionShape = $CollisionShape2D
var damageType:Damage_Type
var cooldown:float
var manaCost:int
var attributes:SpellResource

func _init(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_shapeActivation, s_cooldown = 0, s_manaCost = 0):
	attributes = SpellResource.new(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_shapeActivation, s_cooldown, s_manaCost)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print(attributes.name, attributes.damageType, attributes.shapeType)
	if attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.SQUARE:
		shape = Square.new(self, attributes.radius)
	elif attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.CIRCLE:
		shape = Circle.new(self, attributes.radius)
	
		
	if attributes.damageType == SPELL_ATTRIBUTES.DAMAGE_TYPE.FIRE:
		damageType = Damage_Type_Fire.new(attributes.damage)
	elif attributes.shapeType == SPELL_ATTRIBUTES.DAMAGE_TYPE.WATER:
		damageType = Damage_Type_Water.new(attributes.damage)
		
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
