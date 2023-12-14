extends CharacterBody2D

var speed = 100
var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	player_state = "idle" if (direction == Vector2.ZERO) else "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)
	
func play_anim(direction):
	if  (player_state == "idle"):
		$AnimatedSprite2D.play("idle")
	if (player_state == "walking"):
		if direction.y == -1:
			$AnimatedSprite2D.play("n-walk")
		if direction.x == -1:
			$AnimatedSprite2D.play("w-walk")
		if direction.y == 1:
			$AnimatedSprite2D.play("s-walk")
		if direction.x == 1:
			$AnimatedSprite2D.play("e-walk")
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("ne-walk")
		if direction.x > 0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("se-walk")
		if direction.x < -0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("sw-walk")
		if direction.x < -0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("nw-walk")
			
func player():
	pass
	
