extends Marker2D

var ball = preload("res://ball.tscn")

func destroy():
	if self.get_child_count() > 0:
		self.get_child(0).queue_free()

func respawn():
	var ball_instance = ball.instance()
	self.add_child(ball_instance)
