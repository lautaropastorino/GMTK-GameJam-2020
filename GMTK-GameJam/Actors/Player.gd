extends KinematicBody2D

const GRAVITY = 30
const MAX_FALL_SPEED = 300
signal death_signal
var points = 0
onready var lbl_puntos = preload("res://HUD/CanvasPuntos.tscn")
var puntos_lbl
var y_velo = 0
onready var animation = $AnimatedSprite
var facing_right = true
var game_over = false

func _ready():
	puntos_lbl = lbl_puntos.instance()
	add_child(puntos_lbl)

func _physics_process(delta):
	if !game_over:
		var colisiones = move_and_collide(Vector2(0, y_velo*delta))
		
		if !colisiones:
			animation.play("fall")
		elif colisiones.collider in get_tree().get_nodes_in_group("obstaculos"):
			animation.play("die")
			emit_signal("death_signal")
			$PointsTimer.stop()
			game_over = true
			
		y_velo += GRAVITY
		
		if y_velo > MAX_FALL_SPEED:
			y_velo = MAX_FALL_SPEED


func _on_PointsTimer_timeout():
	points += 5
	puntos_lbl.get_node("PointsLabel").set_text("Score: " + str(points))


