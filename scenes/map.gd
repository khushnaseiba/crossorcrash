extends Node2D

var car_scene : PackedScene = preload("res://scenes/car.tscn")
# Called when the node enters the scene tree for the first time.

func _on_timer_timeout() -> void:
	var car = car_scene.instantiate()
	var pos = $carposition.get_children().pick_random()
	car.position = pos.position
	$object.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(_body):
	get_tree().call_deferred("change_scene_to_file","res://crash.tscn")
	


func _on_finish_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://end.tscn")
