extends TextureRect

func _ready():
	$Anim.play("spawn")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func activateMola():
	$Anim.play("activate")