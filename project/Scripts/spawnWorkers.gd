extends Node

@export var spawnTimer: Timer

func _ready():
	_randomize_time(4, 10)
	
func _spawn_worker():
	var workerNode = preload("res://Scenes/worker.tscn")
	var instance = workerNode.instantiate()
	
	add_child(instance)
	instance.position = self.position

func _randomize_time(first: int, second: int):
	var randomNum = randf_range(first, second)
	spawnTimer.wait_time = randomNum
	spawnTimer.start()

func _on_spawn_worker_timer_timeout():
	_spawn_worker()

func _on_child_exiting_tree(node):
	_randomize_time(0, 3)
