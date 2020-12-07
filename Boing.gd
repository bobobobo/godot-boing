extends Node2D

var state: Object

var number_of_players = 1

func _ready():
	state = $MainMenu
	call_deferred("_enter_state")
	
	
func transition_to(new_state):
	state = get_node(new_state)
	_enter_state()


func _enter_state():
	state.enter(self, self)

func _process(delta):
	if state.has_method("process"):
		state.process(delta)
