extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
const TIME_PERIOD = 0.5 # 500ms

var time = 0

func _process(delta):
	var spdBullet = 4
	move_local_x(spdBullet)
	#move_local_y(spdBullet)
	time+=delta #observa o tempo de execução
	if time>=0.3:
		 queue_free() #deleta objeto
	destroyBullet()
	
func destroyBullet(): #verifica se o node do inimigo é diferente de nulo (se existe) distancia com o inimigo
	if(get_tree().get_root().get_node("colworld").get_node("inimigo") != null):
		if(get_position().distance_to(	get_tree().get_root().get_node("colworld").get_node("inimigo").get_position()) < 40 ):
			get_tree().get_root().get_node("colworld").get_node("inimigo").queue_free()
	

	
