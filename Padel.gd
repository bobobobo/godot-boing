extends Area2D

const INITIAL_SPEED = 150
var height
var speed

func _ready():
	height = get_viewport_rect().size.y
	speed = INITIAL_SPEED


func process(delta):
	var direction = $Controller.get_direction(delta)
	position.y = clamp(position.y + direction * speed * delta, 80, height-80)



func _on_area_entered(area):
	if area.name == "Ball":
		$AnimationPlayer.play("Hit")


func _on_lost_point():
	$AnimationPlayer.play("Lost")
