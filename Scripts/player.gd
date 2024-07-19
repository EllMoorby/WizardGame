extends CharacterBody2D

class_name Player

@onready var spell: PackedScene = preload("res://Scenes/Spell.tscn")

@export_group("Base Stats")
@export var maxHealth = 1000
@export var moveSpeed:float = 300.0
var health = maxHealth

var currentSpeed = 0
var lastPos = Vector2.ZERO

@export_group("Other")

const offset = 100.0
enum Shape {SQUARE, CIRCLE}
enum Damage {FIRE, WATER}

func _ready():
	var testspell := spell.instantiate()
	add_child(testspell)

		
func die():
	queue_free()


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
