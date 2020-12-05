extends Area2D


var INITIAL_SPEED = 150
var speed = 150
var direction

signal on_bounce(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioPlayer.add_sound("hit", ["res://sound/hit0.ogg","res://sound/hit1.ogg","res://sound/hit2.ogg","res://sound/hit3.ogg","res://sound/hit4.ogg"])
	$AudioPlayer.add_sound("hit_slow", ["res://sound/hit_slow0.ogg"])
	$AudioPlayer.add_sound("hit_medium", ["res://sound/hit_medium0.ogg"])
	$AudioPlayer.add_sound("hit_fast", ["res://sound/hit_fast0.ogg"])
	$AudioPlayer.add_sound("hit_veryfast", ["res://sound/hit_veryfast0.ogg"])
	$AudioPlayer.add_sound("bounce", ["res://sound/bounce0.ogg","res://sound/bounce1.ogg","res://sound/bounce2.ogg","res://sound/bounce3.ogg","res://sound/bounce4.ogg"])
	$AudioPlayer.add_sound("bounce_synth", ["res://sound/bounce_synth0.ogg"])
	$AudioPlayer.add_sound("score", ["res://sound/score_goal0.ogg"])	
	restart(-1)


func restart(start_direction):
	direction = Vector2(start_direction, 0).normalized()
	position.x =get_viewport_rect().size.x/2
	position.y =get_viewport_rect().size.y/2
	speed = INITIAL_SPEED
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + direction * speed * delta
	speed = speed + 1 * delta
	pass


func _on_area_entered(area):
	if "Goal" in area.name:
		$AudioPlayer.play_sound("score")
		return
	emit_signal("on_bounce", position)
	
	if "Player" in area.name:
		$AudioPlayer.play_sound("hit")
		if speed < 200:
			$AudioPlayer.play_sound("hit_slow")
		elif speed < 300:
			$AudioPlayer.play_sound("hit_medium")
		elif speed < 400:
			$AudioPlayer.play_sound("hit_fast")
		else:
			$AudioPlayer.play_sound("hit_veryfast")
			
		var hit_position = (area.position.y - position.y) / 128
		direction = Vector2(-direction.x, clamp(direction.y + hit_position, -1, 1)).normalized()

	if "Wall" in area.name:
		$AudioPlayer.play_sound("bounce")
		$AudioPlayer.play_sound("bounce_synth")
		direction = Vector2(direction.x, -direction.y).normalized()

