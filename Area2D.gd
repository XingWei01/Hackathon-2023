extends Area2D

var battle = preload("res://Battle Scene/battle.tscn")



func _on_body_entered(body):
	$"../Animation/AnimationPlayer".play("TransIn")
	await get_tree().create_timer(1.5).timeout
	var battleTemp = battle.instantiate()
	get_parent().add_child(battleTemp)
	queue_free()
	$"../Animation/AnimationPlayer".play("TransOut")
