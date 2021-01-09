extends KinematicBody2D

const MAX_SPEED = 150
const MAX_SPRINT = 200

var velocity = Vector2.ZERO

onready var animationPlayer = $Sprite/AnimationPlayer
onready var animationTree = $Sprite/AnimationTree
onready var animationState = animationTree.get("parameter/playback")

func _process(delta):
	var input_Vector = Vector2.ZERO
	input_Vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_Vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_Vector = input_Vector.normalized()
	
	if input_Vector != Vector2.ZERO:
		animationTree.set('parameters/Walk/blend_position', input_Vector)
		velocity = input_Vector
	else:
		velocity = Vector2.ZERO
		
	
	move_and_slide(velocity * MAX_SPEED)
	
	# Commented out due to _physics_process causes the player to jitter if monitor refresh rate is >60 Hz. Current solution
# is to just change _physics_process to _process. 
#func _physics_process(delta):
#	var input_Vector = Vector2.ZERO
#	input_Vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#	input_Vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
#	input_Vector = input_Vector.normalized()
#	if input_Vector != Vector2.ZERO:
#		velocity = input_Vector
#	else:
#		velocity = Vector2.ZERO
#
#		move_and_slide(velocity * MAX_SPEED)
