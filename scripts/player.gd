extends CharacterBody2D

#adding in jump sfx
@onready var _1st_jump_sfx: AudioStreamPlayer2D = $"1stjump_sfx"
@onready var double_jump_sfx: AudioStreamPlayer2D = $double_jump_sfx


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim = $Sprite2D
var jumpcount = 0 # counting the jumps
var max_jumps = 2 # setting a max, so the player can't jump infinitely
var is_double_jumping = false # flag to track if the double jump animation should play

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumpcount = 0 # reset jump count when player reaches the ground
		is_double_jumping = false
		if abs(velocity.x) > 1:
			anim.animation = "run"
		else: 
			anim.animation= "idle"

	# Handle horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.y <= 0.0: # so when player moving up
		# Handle jump animations
		if jumpcount == 1:
			anim.animation = "jump"
		elif jumpcount == max_jumps:
			anim.animation = "double_jump"
			is_double_jumping = true
	elif velocity.y > 0.0: #when player is moving down the "falling" animation should play
		anim.play("falling")
	
	#adding in jumping sfx when 1st jump
	if Input.is_action_just_pressed("jump") and jumpcount < 1:
		_1st_jump_sfx.play()
	
	# Handle jumping and double jumping
	if Input.is_action_just_pressed("jump") and jumpcount < max_jumps:
		double_jump_sfx.play()
		velocity.y = JUMP_VELOCITY
		jumpcount += 1

	move_and_slide()

	# Check which direction player is facing
	anim.flip_h = velocity.x < 0
