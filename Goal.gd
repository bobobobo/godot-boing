extends Area2D

signal on_goal

func _on_area_entered(area, x_direction):
	if area.name == "Ball":
		area.restart(x_direction)
		emit_signal("on_goal")
