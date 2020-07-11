extends Node2D

onready var piedra_sola = preload("res://Obstacles/PiedraSola.tscn")
onready var piedra_par = preload("res://Obstacles/PiedraPar.tscn")
onready var death_screen = preload("res://HUD/death_screen_canvas.tscn")
var letras = ["F", "A", "S", "D"]
var letra_ant = ""
var y_min
var y_max

func _ready():
	y_min = 400
	y_max = 450
	
func _on_ObstacleSpawn_timeout():
	randomize()
	var piedra
	if rand_range(0, 1) >= 0.5:
		piedra = piedra_sola.instance()
	else:
		piedra = piedra_par.instance()
		
	var letra = letras[randi() % 4]
	while letra == letra_ant:
		letra = letras[randi() % 4]
	letra_ant = letra
	piedra.init(letra, rand_range(y_min, y_max))
	add_child(piedra)
	y_min += 200
	y_max += 200


func _on_Player_death_signal():
	get_tree().call_group("obstaculos","game_over")
	var d_screen = death_screen.instance()
	add_child(d_screen)


