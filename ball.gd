extends RigidBody2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
