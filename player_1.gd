extends CharacterBody2D

@export var speed = 400
var screen_size
var team_id = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO

	if(Input.is_action_pressed("p1_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("p1_down")):
		velocity.y += 1
	if(Input.is_action_pressed("p1_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("p1_right")):
		velocity.x += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
