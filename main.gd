extends Node

@export var ball_scene: PackedScene
var score1 = 0
var score2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(score1 == 5):
		game_over(1)
	
	elif(score2 == 5):
		game_over(2)

func rede1_goal_scored():
	score2 += 1
	$HUD.show_goal(2)
	new_round()
	
func rede2_goal_scored():
	score1 += 1
	$HUD.show_goal(1)
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
	$HUD.update_score(score1, score2)
	$HUD.show_message("Começou!")
	$Player1.start($Marker1.position)
	$Player2.start($Marker2.position)
	$Ball.start($MarkerBall.position)
	$Rede1.start($MarkerRede1.position)
	$Rede2.start($MarkerRede2.position)
	$StartTimer.start()

func _on_timer_timeout():
	#$HUD.update_score(score1, score2)
	#game_over()
	pass

func _on_start_timer_timeout():
	$Timer.start()
	
func game_over(team_id):
	$HUD.show_game_over(team_id)

func _on_rede_1_body_entered(body):
	if(body == $Ball/CollisionShape2D):
		rede1_goal_scored()

func _on_rede_2_body_entered(body):
	if(body == $Ball/CollisionShape2D):
		rede2_goal_scored()
