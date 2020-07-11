extends KinematicBody2D

const GRAVITY = 30
const MAX_FALL_SPEED = 300

var y_velo = 0
onready var animation = $AnimatedSprite
var facing_right = true

func _physics_process(delta):
	move_and_slide(Vector2(0, y_velo), Vector2(0, -1))
	
	var grounded = is_on_floor()
	
	if !grounded:
		animation.play("fall")
	else:
		animation.play("die")
	
	y_velo += GRAVITY
	
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		

	
