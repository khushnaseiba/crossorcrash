extends Area2D

var direction : Vector2 = Vector2.LEFT
var speed : int = 100
var color = [preload("res://graphics/cars/green.png"),preload("res://graphics/cars/red.png"),preload("res://graphics/cars/yellow.png")]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if position.x < 0 :
		direction.x=1
		$Sprite2D.flip_h = true
	$Sprite2D.texture = color.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position +=direction*speed*delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
