extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var move_speed = 170

func process_movement_animation(current_vector_values, current_speed):
	
	# TODO below line is very ugly animation, fix it later
	if current_vector_values == Vector2(0,0):
		animated_sprite_2d.stop()
	
	if current_vector_values == Vector2(-1, 0):
		animated_sprite_2d.play("WalkingLeft")
	elif current_vector_values == Vector2(1, 0):
		animated_sprite_2d.play("WalkingRight")
	elif current_vector_values == Vector2(0, -1):
		animated_sprite_2d.play("WalkingUp")
	elif current_vector_values == Vector2(0, 1):
		animated_sprite_2d.play("WalkingDown")

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * move_speed
	process_movement_animation(input_direction, velocity)

func _physics_process(delta):
	get_input()
	move_and_slide()
