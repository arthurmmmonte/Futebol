extends Area2D

signal hit
signal goal_scored()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if(body.name == "Ball"):
		emit_signal("goal_scored")

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
