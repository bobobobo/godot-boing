extends Node

var player
var ball
var timer = 0
var current_direction = 0

func _init(player, ball):
	self.player = player
	self.ball = ball

func get_direction(delta):
	if timer > 0:
		timer = timer - delta
		return current_direction
		
	current_direction = 0
	if ball.position.y - player.position.y > 30:
		current_direction = 1
		timer = 0.1 + randf() * 0.2
	elif ball.position.y - player.position.y < -30:
		current_direction = -1
		timer = 0.1 + randf() * 0.2
	return current_direction
