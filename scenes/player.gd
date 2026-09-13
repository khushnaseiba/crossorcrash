extends CharacterBody2D


const SPEED = 10000.0
const JUMP_VELOCITY = -400.0

var direction : Vector2 = Vector2.LEFT

func _ready() -> void:
	position = Vector2(0,280)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	direction = Input.get_vector("left","right",'up','down')
	velocity = direction*SPEED*delta
	move_and_slide()
	animation()
func animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x>0
		if direction.x != 0:
			$AnimatedSprite2D.animation="left"
		else:
			$AnimatedSprite2D.animation = "up" if direction.y<0 else "down"
	else:
		$AnimatedSprite2D.frame = 0	
		
		
		
