extends CharacterBody2D
 
 
var SPEED = 400.0
 
 
func _physics_process(delta: float) -> void:

	velocity=Vector2()

	if Input.is_action_pressed("a"):

		velocity.x-=1

	if Input.is_action_pressed("d"):

		velocity.x+=1

	if Input.is_action_pressed("w"):

		velocity.y-=1

	if Input.is_action_pressed("s"):

		velocity.y+=1

	velocity=velocity*SPEED
 
 
	move_and_slide()

 
