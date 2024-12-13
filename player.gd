extends CharacterBody2D
<<<<<<< Updated upstream
<<<<<<< Updated upstream
 
 
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

 
=======
=======
>>>>>>> Stashed changes

var SPEED = 400.0
@onready var bullet = preload("res://bullet.tscn")
@onready var marker = $bow/Marker2D  # Reference to the marker, child of the player

func _physics_process(delta: float) -> void:
	# Cleaner movement using Input.get_vector()
	velocity = Input.get_vector("a", "d", "w", "s") * SPEED
	move_and_slide()  # Move the player

	if Input.is_action_pressed("->"):
		shoot_bullet(Vector2(1, 0))  # Shoot right

	if Input.is_action_pressed("<-"):
		shoot_bullet(Vector2(-1, 0))  # Shoot left

	if Input.is_action_pressed("down"):
		shoot_bullet(Vector2(0, 1))  # Shoot down

	if Input.is_action_pressed("up"):
		marker.position.y = -200  # Optional movement of the marker, but this might not be needed
		shoot_bullet(Vector2(0, -1))  # Shoot up
		marker.position.y = 377.263
		

func shoot_bullet(direction: Vector2) -> void:
	var bullet_temp = bullet.instantiate()
	get_parent().add_child(bullet_temp)  # Add the bullet to the parent's scene, not as a child of the player
	bullet_temp.position = marker.global_position  # Use global position to ensure it's aligned with world space
	if bullet_temp.has_method("set_direction"):
		bullet_temp.set_direction(direction)  # Call a custom method in bullet if it exists
	elif bullet_temp.has_variable("direction"):
		bullet_temp.direction = direction  # Or directly set the variable if it exists
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
