extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var move_speed = 130
var current_direction = "none"

func attack_handler():
	animation_handler("Attack")

func animation_handler(status: String):
	var dir = current_direction
	
	# movement animations
	if dir == "right":
		if status == "moving":
			animated_sprite_2d.play("WalkingRight")
		elif status =="not moving":
			animated_sprite_2d.play("IdleRight")
	elif dir == "left":
		if status == "moving":
			animated_sprite_2d.play("WalkingLeft")
		elif status == "not moving":
			animated_sprite_2d.play("IdleLeft")
	elif dir == "up":
		if status == "moving":
			animated_sprite_2d.play("WalkingUp")
		elif status == "not moving":
			animated_sprite_2d.play("IdleUp")
	elif dir == "down":
		if status == "moving":
			animated_sprite_2d.play("WalkingDown")
		elif status == "not moving":
			animated_sprite_2d.play("IdleDown")
	
	# Attack animations
	if dir == "right" and status == "Attack":
		animated_sprite_2d.play("AttackRight")
		await(animated_sprite_2d.finished)
	elif dir == "left" and status == "Attack":
		animated_sprite_2d.play("AttackLeft")
	elif dir == "up" and status == "Attack":
		animated_sprite_2d.play("AttackUp")
	elif dir == "down" and status == "Attack":
		animated_sprite_2d.play("AttackDown")
	

func player_movement(delta):
	
	if Input.is_action_pressed("ui_down"):
		current_direction = "down"
		animation_handler("moving")
		velocity.y = move_speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		animation_handler("moving")
		velocity.y = -move_speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		current_direction = "right"
		animation_handler("moving")
		velocity.x = move_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		animation_handler("moving")
		velocity.x = -move_speed
		velocity.y = 0
	else:
		animation_handler("not moving")
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func _physics_process(delta):
	player_movement(delta)
	
	if Input.is_action_just_pressed("Attack"):
		attack_handler()
