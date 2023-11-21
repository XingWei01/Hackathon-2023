extends Node2D

@onready var anim_player = $AnimationPlayer


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	anim_player.play("Stepped")


