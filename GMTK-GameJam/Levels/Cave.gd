extends Node2D


const CANT_OBSTACULOS = 4
onready var piedra_sola = preload("res://Obstacles/PiedraSola.tscn")
onready var piedra_par = preload("res://Obstacles/PiedraPar.tscn")
var letras = ["A", "S", "D", "F"]

func _ready():
	var piedra
	var pos_y = 192
	for i in range(CANT_OBSTACULOS):
		piedra = piedra_sola.instance() if rand_range(0, 1) == 1 else piedra_par.instance()
		piedra.init(letras[i])
		piedra.set_position(Vector2(rand_range(256, 480), rand_range(pos_y, 900)))
		add_child(piedra)
		pos_y += 50
		
	
