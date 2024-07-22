extends CharacterBody2D
class_name Player

@export_group("Base Stats")
@export var maxHealth = 1000
@export var moveSpeed:float = 300.0
var health = maxHealth

var activeSpell:Spell

@export_group("Other")

const offset = 100.0

signal health_update(health)

func _ready():
	activeSpell = Spell.createSpell("TestSpell", 10,SPELL_ATTRIBUTES.DAMAGE_TYPE.WATER, 
	SPELL_ATTRIBUTES.SHAPE_TYPE.CIRCLE, 20,SPELL_ATTRIBUTES.SHAPE_ACTIVATION.INSTANT,[[SPELL_ATTRIBUTES.MODIFIER_TYPE.DAMAGE,5],[SPELL_ATTRIBUTES.MODIFIER_TYPE.RADIUS,10]],1)
	add_child(activeSpell)
	health_update.emit(health)
	
func die():
	queue_free()
	
func takeDamage(damage:int):
	health -= damage
	health_update.emit(health)
	if health <= 0:
		die()
	
func _process(delta):
	activeSpell.target = get_global_mouse_position()
	
	if Input.is_key_pressed(KEY_SPACE) and activeSpell.isOnCooldown() == false:
		activeSpell.use()

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
