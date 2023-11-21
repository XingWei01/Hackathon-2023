extends Node2D

var battle = preload("res://Battle Scene/Battle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		$"../../UI/AnimationPlayer".play("TransIn")
		await get_tree().create_timer(1.5).timeout
		var battleTemp = battle.instantiate()
		get_parent().add_child(battleTemp)
		queue_free()
