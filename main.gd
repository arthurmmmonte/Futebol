extends Node

@export var ball_scene: PackedScene
var score1 = 0
var score2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_rede_goal_scored():
	score2 += 1
	#Animacao fez gol
	new_round()
	
func _on_rede_2_goal_scored():
	score1 += 1
	#Animacao fez gol
	new_round()

func new_round():
	$Player1.start($Marker1.position)
	$Player2.start($Marker2.position)
	$Ball.start($MarkerBall.position)
	$Rede1.start($MarkerRede1.position)
	$Rede2.start($MarkerRede2.position)
	$StartTimer.start()
	
func new_game():
	score1 = 0
	score2 = 0
	$Player1.start($Marker1.position)
	$Player2.start($Marker2.position)
	$Ball.start($MarkerBall.position)
	$Rede1.start($MarkerRede1.position)
	$Rede2.start($MarkerRede2.position)
	$StartTimer.start()

func _on_timer_timeout():
	game_over()


func _on_start_timer_timeout():
	$Timer.start()
	
func game_over():
	$Timer.stop()
