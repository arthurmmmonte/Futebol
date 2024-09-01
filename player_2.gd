extends CharacterBody2D

@export var speed = 400
var screen_size
var team_id = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	var input_dir = Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
	velocity = input_dir * speed

func start(pos):
	position = pos
	#set_deferred("monitoring", true)
