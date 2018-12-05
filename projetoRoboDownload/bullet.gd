extends RigidBody2D

# Member variables
var disabled = false
var faced = false

func disable():
	if disabled:
		return
	$anim.play("shutdown")
	disabled = true

func _integrate_forces(s):
	var lv = s.get_linear_velocity()
	
	if !faced:
		
		gravity_scale = 0.4
		
		if lv.x < 0:
			$sprite.scale.x = -0.2
		else:
			$sprite.scale.x = 0.2
		faced = true
	
	
	if(angular_velocity != 0):
		disable()

