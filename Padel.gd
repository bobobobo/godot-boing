extends Area2D

const INITIAL_SPEED = 250
var height
var speed

func _ready():
	height = get_viewport_rect().size.y
	speed = INITIAL_SPEED


func _process(delta):
	var direction = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position.y = clamp(position.y + direction * speed * delta, 80, height-80)



func _on_area_entered(area):
	if area.name == "Ball":
		$AnimationPlayer.play("Hit")


func _on_lost_point():
	$AnimationPlayer.play("Lost")
