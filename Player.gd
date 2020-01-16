extends RigidBody2D

# Declare member variables here. Examples:
var move_left:bool
var move_right:bool
var move_down:bool
var move_up:bool
var gravity = 50
var turn_left: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	set_friction(0.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_left = Input.is_action_pressed("ui_left")
	move_right = Input.is_action_pressed("ui_right")
	move_down = Input.is_action_pressed("ui_down")
	move_up = Input.is_action_pressed("ui_up")
	var velocity = Vector2()
	velocity.y = gravity
	if move_left:
		velocity.x = -50
		turn_left = true
	if move_right:
		turn_left = false
		velocity.x = 50
	if move_down:
		velocity.y = 100
	if move_up:
		velocity.y = -300
	set_linear_velocity(velocity)
	$AnimatedSprite.flip_h = turn_left
	if velocity.x != 0:
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	if velocity.y < 0:
		$AnimatedSprite.play("jump")
	if Input.is_action_pressed("player_attack"):
		$AnimatedSprite.play("attack")
	
