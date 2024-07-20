extends Area2D
class_name Spell

const spellBase = preload("res://Scenes/Spell.tscn")
var shape:Shape
var damageType:Damage_Type
var attributes:SpellResource
var target = Vector2.ZERO

var currentCooldown:float = 0

static func createSpell(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_shapeActivation, s_cooldown = 0, s_manaCost = 0):
	var newSpell = spellBase.instantiate()
	newSpell.attributes = SpellResource.new(s_name,s_damage, s_damageType, s_shapeType, s_radius, s_shapeActivation, s_cooldown, s_manaCost)
	return newSpell
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print(attributes.name, attributes.damageType, attributes.shapeType)
	if attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.SQUARE:
		shape = SquareSpell.new(self, attributes.radius)
	elif attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.CIRCLE:
		shape = CircleSpell.new(self, attributes.radius)
	elif attributes.shapeType == SPELL_ATTRIBUTES.SHAPE_TYPE.BOLT:
		shape = BoltSpell.new(self, attributes.radius)
	
		
	if attributes.damageType == SPELL_ATTRIBUTES.DAMAGE_TYPE.FIRE:
		damageType = Damage_Type_Fire.new(attributes.damage)
	elif attributes.shapeType == SPELL_ATTRIBUTES.DAMAGE_TYPE.WATER:
		damageType = Damage_Type_Water.new(attributes.damage)
		
	
	
	
func use():
	currentCooldown = attributes.cooldown
	shape.onUse()
	
func isOnCooldown():
	if currentCooldown > 0:
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentCooldown > 0:
		currentCooldown -= delta
	pass
