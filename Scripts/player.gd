extends CharacterBody2D
class_name Player

@export_group("Base Stats")
@export var maxHealth:int = 1000
@export var maxMana:int = 100
@export var moveSpeed:float = 300.0
var health = maxHealth
var mana = maxMana

var activeSpell:Spell

@export_group("Other")
@export var manaRegenPS:int = 5

var perSecondCounter:float = 0

signal health_update(health)
signal mana_update(mana)

func _ready():
	var spellR = SpellResource.new("TestSpell", 10,SPELL_ATTRIBUTES.DAMAGE_TYPE.WATER, 
	SPELL_ATTRIBUTES.SHAPE_TYPE.BOLT, 20,SPELL_ATTRIBUTES.SHAPE_ACTIVATION.INSTANT, 100, [[SPELL_ATTRIBUTES.MODIFIER_TYPE.DAMAGE,5],[SPELL_ATTRIBUTES.MODIFIER_TYPE.RADIUS,10]],1)
	activeSpell = Spell.createSpell(spellR)
	add_child(activeSpell)
	health_update.emit(health)
	mana_update.emit(mana)
	
func die():
	queue_free()
	
func takeDamage(damage:int):
	health -= damage
	health_update.emit(health)
	if health <= 0:
		die()
	
func calculatePerSecondStats():
	mana = min(mana+manaRegenPS,maxMana)
	mana_update.emit(mana)

func _process(delta):
	perSecondCounter += delta
	if perSecondCounter >= 1:
		calculatePerSecondStats()
		perSecondCounter = 0
	
	activeSpell.target = get_global_mouse_position()
	
	if Input.is_key_pressed(KEY_SPACE) and activeSpell.isOnCooldown() == false:
		if activeSpell.getManaCost() <= mana:
			activeSpell.use()
			mana -= activeSpell.getManaCost()
		
	

func _physics_process(delta):
	
	
	#Get direction
	var direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis('move_up','move_down')
	).normalized()
	
	#If not moving in x
	
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = direction * moveSpeed

	move_and_slide()
