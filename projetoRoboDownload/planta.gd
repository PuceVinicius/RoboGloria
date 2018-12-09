extends Area2D

# Member variables
var taken = false

func _on_body_enter( body ):
	if not taken and body is preload("res://player.gd"):
		$anim.play("taken")
		taken = true
		if not body.getHasPlanta():
			body.setHasPlanta(true)