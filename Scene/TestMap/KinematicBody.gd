extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed = 12
var velocity = Vector3()

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	
func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("ui_up"):
		velocity.z -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.z += speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	
