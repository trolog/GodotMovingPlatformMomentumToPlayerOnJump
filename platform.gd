extends KinematicBody2D

var velocity = Vector2.ZERO
var old_pos = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = global_position - old_pos
	
	old_pos = global_position
	
	#print(velocity)
	pass
