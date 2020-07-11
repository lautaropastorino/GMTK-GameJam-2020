extends KinematicBody2D

const GRAVITY = 30
const MAX_FALL_SPEED = 300
signal death_signal
var points = 0

var y_velo = 0
onready var animation = $AnimatedSprite
var facing_right = true

func _physics_process(delta):
	var colisiones = move_and_collide(Vector2(0, y_velo*delta))
	
	if !colisiones:
		animation.play("fall")
	else:
		animation.play("die")
		emit_signal("death_signal")
		$PointsTimer.stop()
		
	y_velo += GRAVITY
	
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED


func _on_PointsTimer_timeout():
	points += 5
	$Camera2D/PointsLabel.set_text("Score: " + str(points))


