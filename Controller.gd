extends Node

var up_action
var down_action

func _init(up_action="player1_up", down_action="player1_down"):
	self.up_action = up_action
	self.down_action = down_action

func get_direction(_delta):
	return Input.get_action_strength(down_action) - Input.get_action_strength(up_action)
