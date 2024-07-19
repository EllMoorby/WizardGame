extends CharacterBody2D

class_name Player

@export_group("Base Stats")
@export var maxHealth = 1000
@export var moveSpeed:float = 300.0
var health = maxHealth

var currentSpeed = 0
var lastPos = Vector2.ZERO
var activeSpell:Spell

@export_group("Other")

const offset = 100.0
enum Shape {SQUARE, CIRCLE}
enum Damage {FIRE, WATER}

func _ready():
	activeSpell = Spell.new("TestSpell", 100,SPELL_ATTRIBUTES.DAMAGE_TYPE.FIRE, 
	SPELL_ATTRIBUTES.SHAPE_TYPE.CIRCLE, 20,SPELL_ATTRIBUTES.SHAPE_ACTIVATION.INSTANT)
	add_child(activeSpell)

		
func die():
	queue_free()


func _physics_process(delta):
	activeSpell.position = get_global_mouse_position() - self.position
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
