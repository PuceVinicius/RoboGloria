extends Sprite

# Member variables
var active = false

func onMolaPickup():
	if not active:
		active = true
		$anim.play("activate")

