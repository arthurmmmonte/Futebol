extends Node

@export var num_instances = 9
@export var spacing = Vector2(300, 300)  # Spacing between each Main instance
@export var columns = 3  # Number of columns in the grid
@export var main_scene_path = "res://main.tscn"  # Path to your Main scene

func _ready():
	for i in range(num_instances):
		var main_instance = preload("res://main.tscn")
		var instance = main_instance.instantiate()
		add_child(instance)
		
		# Calculate the position in the grid
		var row = i / columns
		var col = i % columns
		
		# Set the position of the Main instance
		instance.position = Vector2(col * spacing.x, row * spacing.y)
