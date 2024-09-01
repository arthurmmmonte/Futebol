extends RigidBody2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_to_rigid_mode():
	# Ensure physics are fully re-enabled
	self.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC


func start(pos):
	call_deferred("set", "freeze", true)
	
	# Reset velocities to ensure no movement
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	
	# Move to the new position
	PhysicsServer2D.body_set_state(
	get_rid(),
	PhysicsServer2D.BODY_STATE_TRANSFORM,
	Transform2D.IDENTITY.translated(pos))
	
	# Ensure the body is awake
	sleeping = false
	
	call_deferred("set", "freeze", false)
