extends CharacterBody2D



var SPEED = 110.0

@onready var anim = $AnimationTree
@onready var anim_state = anim.get("parameters/playback")

func _physics_process(delta):
	var inputDir = Input.get_vector("ui_left","ui_right","ui_up","ui_down",0)
	
	if inputDir:
		velocity = inputDir * SPEED
		anim_state.travel("Walk")
		anim.set("parameters/Idle/blend_position", inputDir)
		anim.set("parameters/Walk/blend_position", inputDir)
		
	else:
		anim_state.travel("Idle")
		velocity.x = move_toward(velocity.x, 0, 20)
		velocity.y = move_toward(velocity.y, 0, 20)
	move_and_slide()


func _on_battle_spawn_body_entered(body):
	pass
	#SPEED = 0
