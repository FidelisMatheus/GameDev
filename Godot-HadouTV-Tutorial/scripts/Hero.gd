extends KinematicBody2D

# Constants
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 20000
const JUMP_HEIGHT = -650

## o Godot trata do vector de forma contraria sendo quando mais positivo, mas para baixo
## negativo para cima

# Variables
var motion = Vector2()

# When our Hero is ready
func _ready():
	$Sprite.flip_h = false #evita que tenha sprites para cada direção de lado
	#var node = get_node("Sprite")

# Infinite loop
# _physics_process é otimizado para trabalhar com física do personagem
# delta é cada ciclo de máquina

func _physics_process(delta):
	var speed = SPEED * delta
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$Sprite.play('walk')						
		
		motion.x = -speed		
	elif  Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		$Sprite.play('walk')
			
		motion.x = speed
	else:
		$Sprite.play('idle') # parado
		motion.x = 0

	if is_on_floor():
		if Input.is_action_pressed("ui_jump"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play('jump')

	motion = move_and_slide(motion, UP)
	# move_and_slide atualiza de modo suave
