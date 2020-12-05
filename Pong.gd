extends Node2D

const Impact = preload("res://Impact.tscn")

var scoreLeft = 0
var scoreRight = 0

func _on_bounce(position):
	var impact = Impact.instance()
	impact.position = position
	add_child(impact)


func _on_goal(player):
	if player == 1:
		scoreLeft = scoreLeft + 1
		$ScoreLeft.set_score(scoreLeft, true)
	elif player == 2:
		scoreRight = scoreRight + 1
		$ScoreRight.set_score(scoreRight, true)
