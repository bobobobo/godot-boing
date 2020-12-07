extends Node2D

const Impact = preload("res://Impact.tscn")
const AiController = preload("res://AiController.gd")
const Controller = preload("res://Controller.gd")
var scoreLeft = 0
var scoreRight = 0
var fsm
var target

func _ready():
	
	$Player1.hide()
	$Player2.hide()
	$Ball.hide()

func enter(fsm, target):
	self.fsm = fsm
	
	if target.number_of_players == 1:
		var aiController = AiController.new($Player2, $Ball)
		aiController.set_name("Controller")
		$Player2.get_node("Controller").replace_by(aiController)
	else:
		var controller = Controller.new("player2_up", "player2_down")
		controller.set_name("Controller")
		$Player2.get_node("Controller").replace_by(controller)
		
	scoreLeft = 0
	scoreRight = 0
	$ScoreLeft.set_score(scoreLeft, false)
	$ScoreRight.set_score(scoreRight, false)
	$Player1.show()
	$Player2.show()
	$Ball.show()
	$Ball.restart(1)
		
func process(delta):
	$Player1.process(delta)
	$Player2.process(delta)
	$Ball.process(delta)


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
		
	if max(scoreLeft, scoreRight) >= 10:
		$Player1.hide()
		$Player2.hide()
		$Ball.hide()
		fsm.transition_to("GameOver")
