extends Area2D
class_name Obstaculo

const MAX_POS = 480
const MIN_POS = 256
var letra = ""
var seleccionar = ""
const LETRAS = {"A": 65, "S": 83, "D": 68, "F": 70}

func init(l):
	letra = l
	$Letra.set_text(letra)	
	seleccionar = LETRAS[l]
	
func _physics_process(delta):
	if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_right"):
		if get_position().x < MAX_POS:
			set_position(Vector2(get_position().x + 10, get_position().y))
	if Input.is_key_pressed(seleccionar) and Input.is_action_pressed("move_left"):
		if get_position().x > MIN_POS:
			set_position(Vector2(get_position().x - 10, get_position().y))
