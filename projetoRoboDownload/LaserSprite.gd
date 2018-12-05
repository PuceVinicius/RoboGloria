extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	$Anim.play("spawn")


func activateLaser():
	$Anim.play("activate")