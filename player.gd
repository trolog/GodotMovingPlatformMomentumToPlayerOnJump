extends KinematicBody2D

export var floor_max_speed = 300
export var air_max_speed = 400

onready var gravity = 900
onready var raycast = get_node("RayCast2D")
onready var sprite = $Sprite

var velocity = Vector2.ZERO
var platform_vol

func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_floor():
		velocity.x -= sign(velocity.x) * 10 # apply friction more aggressive
	else:
		velocity.x -= sign(velocity.x) # apply less friction

func _process(delta):
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y -= 600
		if(raycast.is_colliding()):
			platform_vol = raycast.get_collider()
			velocity.x += (platform_vol.velocity.x * 50)
	
	input_movement()
	if(is_on_floor()):
		if(velocity.x > floor_max_speed):
			velocity.x = floor_max_speed
		if(velocity.x < -floor_max_speed):
			velocity.x = -floor_max_speed
	else:
		if(velocity.x > air_max_speed):
			velocity.x = air_max_speed
		if(velocity.x < -air_max_speed):
			velocity.x = -air_max_speed
			
	velocity = move_and_slide(velocity,Vector2.UP)

	pass
	
func input_movement():
	#Do left right movement keys
	if(Input.is_action_pressed("ui_left")):
		if(is_on_floor()):
			velocity.x -= 25
		else:
			velocity.x -= 5
	if(Input.is_action_pressed("ui_right")):
		if(is_on_floor()):
			velocity.x += 25
		else:
			velocity.x += 5
	

