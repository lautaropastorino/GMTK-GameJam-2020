extends Area2D
class_name Obstaculo

const MAX_POS = 480
const MIN_POS = 288
const INIT_POS = {"IZQ": 256, "MID": 370, "DER": 480}
var letra = ""
var seleccionar = ""
const LETRAS = {"A": 65, "S": 83, "D": 68, "F": 70}

func init(l, ypos):
	letra = l
	$Letra.set_text(letra)	
	seleccionar = LETRAS[l]
	var xpos = INIT_POS[INIT_POS.keys()[rand_range(0, 3)]]
	set_position(Vector2(xpos, ypos))
	
func _physics_process(delta):
	if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_right"):
		if get_position().x < MAX_POS:
			set_position(Vector2(get_position().x + 10, get_position().y))
	if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_left"):
		if get_position().x > MIN_POS:
			set_position(Vector2(get_position().x - 10, get_position().y))
