extends Area2D

signal on_goal

func _on_area_entered(area):
	if area.name == "Ball":
		emit_signal("on_goal")
