extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	fallfromtree()
	
func fallfromtree():
	$AnimationPlayer.play("falling_from_tree")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(0.3).timeout
	queue_free()
