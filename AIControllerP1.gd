extends AIController2D

@onready var ball: RigidBody2D = $"../../Ball"
@onready var rede1: Area2D = $"../../Rede1"
@onready var rede2: Area2D = $"../../Rede2"
@onready var player_2: CharacterBody2D = $"../../Player2"

var move = Vector2.ZERO

func get_obs() -> Dictionary:
	var obs := [
		player_2.position.x,
		player_2.position.y,
		ball.position.x,
		ball.position.y,
		rede1.position.x,
		rede1.position.y,
		rede2.position.x,
		rede2.position.y
	]
	return {"obs":obs}

func get_reward() -> float:
	return reward
	
func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
	}
	
func set_action(action) -> void:
	move.x = action["move"][0]
	move.y = action["move"][1]
