extends CharacterBody2D

@onready var ai_controller = $AIControllerP2

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
	#var input_dir = Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
	#velocity = input_dir * speed
	
	velocity.x = ai_controller.move.x * speed
	velocity.y = ai_controller.move.y * speed

func start(pos):
	position = pos
	#set_deferred("monitoring", true)


func _on_main_gol_1():
	ai_controller.reward += 50.0


func _on_main_gol_2():
	ai_controller.reward -= 20.0


func _on_main_fim():
	if($Main.vencedor == 2):
		ai_controller.reward += 100.0
	elif($Main.vencedor == 1):
		ai_controller.reward -= 50.0


func _on_main_timeout():
	ai_controller.reward -= 1.0


func _on_ball_ball_hit():
	ai_controller.reward += 10.0


func _on_main_borda_entrou():
	ai_controller.reward -= 2.0
