extends Area2D
class_name Obstaculo

const MAX_POS = 480
const MIN_POS = 288
const INIT_POS = {"IZQ": 288, "IZQ_MID": 320, "MID_IZQ": 350, "MID": 370, "MID_DER": 400, "DER_MID": 430, "DER": 480}
var letra = ""
var seleccionar = ""
const LETRAS = {"A": 65, "S": 83, "D": 68, "F": 70}
var rand_pos = RandomNumberGenerator.new()
var muerto = false

func init(l, ypos):
	rand_pos.randomize()
	letra = l
	$Letra.set_text(letra)	
	seleccionar = LETRAS[l]
	var xpos = INIT_POS[INIT_POS.keys()[rand_pos.randi_range(0, 6)]]
	set_position(Vector2(xpos, ypos))
	
func _physics_process(delta):
	if not muerto:
		if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_right"):
			if get_position().x < MAX_POS:
				set_position(Vector2(get_position().x + 10, get_position().y))
		if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_left"):
			if get_position().x > MIN_POS:
				set_position(Vector2(get_position().x - 10, get_position().y))
				
func game_over():
	muerto = true
