extends Node2D


const CANT_OBSTACULOS = 20
onready var piedra_sola = preload("res://Obstacles/PiedraSola.tscn")
onready var piedra_par = preload("res://Obstacles/PiedraPar.tscn")
var letras = ["A", "S", "D", "F"]
var y_min
var y_max
var x_max = 480
var x_min

func _ready():
	y_min = 400
	y_max = 450
	
	


func _on_ObstacleSpawn_timeout():
	var piedra
	for i in range(CANT_OBSTACULOS):
		if rand_range(0, 1) >= 0.5:
			piedra = piedra_sola.instance()
			x_min = 256 
		else:
			x_min = 300
			piedra = piedra_par.instance()
		piedra.init(letras[rand_range(0, 3)])
		piedra.set_position(Vector2(rand_range(288, 480), rand_range(y_min, y_max)))
		add_child(piedra)
		y_min += 200
		y_max += 200