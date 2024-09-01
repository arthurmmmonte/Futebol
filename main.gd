extends Node

@export var ball_scene: PackedScene
var ball_instance: RigidBody2D

var score1 = 0
var score2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	freeze_all()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(score1 == 5):
		game_over(1)
	
	elif(score2 == 5):
		game_over(2)

func freeze_all():
	$Ball.linear_velocity = Vector2.ZERO
	$Ball.angular_velocity = 0
	$Ball.call_deferred("set", "freeze", true)
	$Player1.set_physics_process(false)
	
	$Player2.set_physics_process(false)

func unfreeze_all():
	$Ball.call_deferred("set", "freeze", false)
	$Player1.set_physics_process(true)
	
	$Player2.set_physics_process(true)

func rede1_goal_scored():
	freeze_all()
	score2 += 1
	$HUD.show_goal(2)
	$HUD.update_score(score1, score2)
	await $HUD/MessageTimer.timeout
	
	new_round()
	
func rede2_goal_scored():
	freeze_all()
	score1 += 1
	$HUD.show_goal(1)
	$HUD.update_score(score1, score2)
	await $HUD/MessageTimer.timeout
	
	new_round()

func new_round():
	$Player1.start($Marker1.position)
	$Player2.start($Marker2.position)
	$Ball.start($MarkerBall.position)
	$StartTimer.start()

func new_game():
	$Player1.start($Marker1.position)
	$Player2.start($Marker2.position)
	$Ball.start($MarkerBall.position)
	$Rede1.start($MarkerRede1.position)
	$Rede2.start($MarkerRede2.position)
	
	$StartTimer.start()
	$HUD.show_message("Começou!")

func _on_start_timer_timeout():
	unfreeze_all()
	
func game_over(team_id):
	freeze_all()
	$Ball.freeze = true
	$HUD.show_game_over(team_id)

func _on_rede_1_body_entered(body):
	if(body.name == "Ball"):
		rede1_goal_scored()

func _on_rede_2_body_entered(body):
	if(body.name == "Ball"):
		rede2_goal_scored()
