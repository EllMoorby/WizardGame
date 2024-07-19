extends Marker2D
class_name Spell

var shape:Shape
var damageType:Damage_Type
var cooldown:float
var manaCost:int

var attributes = SpellResource.new("TestSpell", 100,SPELL_ATTRIBUTES.DAMAGE_TYPE.FIRE, SPELL_ATTRIBUTES.SHAPE_TYPE.SQUARE, 100)
# Called when the node enters the scene tree for the first time.
func _ready():
	print(attributes.name, attributes.damageType, attributes.shapeType)
	if attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.SQUARE:
		shape = Square.new(attributes.radius)
	elif attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.CIRCLE:
		shape = Circle.new(attributes.radius)
		
	if attributes.damageType == SPELL_ATTRIBUTES.DAMAGE_TYPE.FIRE:
		damageType = Damage_Type_Fire.new(attributes.damage)
	elif attributes.shapeType == SPELL_ATTRIBUTES.DAMAGE_TYPE.WATER:
		damageType = Damage_Type_Water.new(attributes.damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
