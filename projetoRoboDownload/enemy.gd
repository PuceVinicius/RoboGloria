extends RigidBody2D

# Member variables
const STATE_WALKING = 0
const STATE_DYING = 1

var state = STATE_WALKING

var direction = -1
var anim = ""

onready var rc_left = $raycast_left
onready var rc_right = $raycast_right

var WALK_SPEED = 0

var bullet_class = preload("res://bullet.gd")


func _die():
	queue_free()


func _pre_explode():
	#make sure nothing collides against this
	$shape1.queue_free()
	
	# Stay there
	mode = MODE_STATIC
	$sound_explode.play()


func _integrate_forces(s):
	var lv = s.get_linear_velocity()
	var new_anim = anim
	mode = MODE_KINEMATIC

	if state == STATE_DYING:
		new_anim = "explode"
	elif state == STATE_WALKING:
		new_anim = "walk"
		
		var wall_side = 0.0
		
		for i in range(s.get_contact_count()):
			var cc = s.get_contact_collider_object(i)
			var dp = s.get_contact_local_normal(i)
			
			if cc:
				if cc is bullet_class and not cc.disabled:
					state = STATE_DYING
					#lv = s.get_contact_local_normal(i) * 400
					s.set_angular_velocity(sign(dp.x) * 33.0)
					set_friction(1)
					cc.disable()
					$sound_hit.play()
					break
		
	
	if anim != new_anim:
		anim = new_anim
		$anim.play(anim)
