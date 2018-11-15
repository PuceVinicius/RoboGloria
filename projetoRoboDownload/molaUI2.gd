extends Area2D

# Member variables
var active = false
func onMolaPickup():
	if not active:
		active = true
		$molaAnim.play("activate")

func _on_coin_area_enter(area):
	pass # replace with function body


func _on_coin_area_enter_shape(area_id, area, area_shape, area_shape):
	pass # replace with function body
