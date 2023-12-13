extends KinematicBody2D

var speed = 500  # Adjust this value to set the movement speed

func _ready():
	pass

func _physics_process(delta):
	# Handle input for movement
	var motion = Vector2()

	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("up"):
		motion.y -= 1

	# Normalize the movement vector to prevent faster diagonal movement
	motion = motion.normalized()

	# Move the player and slide
	motion = move_and_slide(motion * speed)

	# Look at the mouse position
	look_at(get_global_mouse_position())
