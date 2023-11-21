extends Control


func _ready():
	await get_tree().create_timer(0).timeout
	$HpBar.max_value = $"../Enemy".get_child(0).Health
	$HpBar.value = $"../Enemy".get_child(0).Health

func _process(delta):
	$EnemyName.text = "AI " + str($"../Enemy".get_child(0).name)
	$Level.text = str($"../Enemy".get_child(0).Level)
