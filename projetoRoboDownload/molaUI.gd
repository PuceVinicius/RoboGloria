extends Sprite
# Member variables
var active = false

func setActive():
	if not active:
		active = true
		$molaAnim.play("activate")