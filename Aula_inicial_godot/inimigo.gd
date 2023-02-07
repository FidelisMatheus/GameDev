extends KinematicBody2D

var spd = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().get_root().get_node("colworld").get_node("player")
	var dir = (player.global_position - global_position).normalized()
	var col = move_and_collide(dir * spd * delta)
	if(col && col.collider.name == "player"):
		player.vida = player.vida - 1
	pass
