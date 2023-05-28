extends KinematicBody2D

var sprite_node
var speed : int = 800 
var jump_force : int = -1000
var gravity : int = 1000
var velocity = Vector2()

func _ready():
	sprite_node = get_node("Sprite")

func get_input(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("right"):
		velocity.x += speed
		$Sprite.flip_h = false
		$AnimationPlayer.play("walk")
		
		
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")
		
	if Input.is_action_pressed("up"):
		$AnimationPlayer.play("jump")
		if (is_on_floor()):
			velocity.y -= speed
			
	if speed == 0:
		$AnimationPlayer.play("idle")
		
	velocity.y += gravity * delta 
	velocity = move_and_slide(velocity, Vector2.UP)
	pass 
		
	
func _physics_process(delta):
	get_input(delta)
