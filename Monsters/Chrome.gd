extends StaticBody2D

var Health = 19
var Level = 1

func _ready():
	$Capture.hide()
	Level = randi_range(1,5)
	spawn()
	await get_tree().create_timer(1).timeout
	idle()
	
	

func hit(damage):
	Health -= damage
	$Target/Attack.show()
	$Target/Attack.play("Strike")
	await get_tree().create_timer(3.45).timeout
	$Target/Attack.pause()
	$Target/Attack.hide()
func spawn():
	$AnimationPlayer.play("spawn")
	
func death():
	$AnimationPlayer.play("death")
	
func idle():
	$AnimationPlayer.play("idle")
	
func capture():
	$Capture.show()
	$Capture/AnimationPlayer.play("capture")
	await get_tree().create_timer(0.5).timeout
	$"Chrome-logo".hide()
