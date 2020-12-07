extends AnimatedSprite

func _ready():
	play("impact")
	yield(self,  "animation_finished")
	queue_free()
