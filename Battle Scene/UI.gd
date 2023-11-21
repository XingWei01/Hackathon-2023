extends Control

var expGained = 8 

func _ready():
	pass


func _on_attack_pressed():
	$Menu.hide()
	$"Fight/GridContainer/Move 1".grab_focus()
	$Fight.show()


func _on_back_pressed():
	$Fight.hide()
	$Menu/GridContainer/Attack.grab_focus()
	$Menu.show()
	$Switch.hide()

func _process(_delta):
	$HpBar.value = Game.selectedINFOMon[get_parent().selected]["Health"]
	$HpBar.max_value = Game.selectedINFOMon[get_parent().selected]["MaxHealth"]
	$ExpBar.value = Game.selectedINFOMon[get_parent().selected]["Exp"]
	$ExpBar.max_value = Game.selectedINFOMon[get_parent().selected]["MaxExp"]
	$PlayerName.text = str(Game.selectedINFOMon[get_parent().selected]["Name"])
	$Level.text = str(Game.selectedINFOMon[get_parent().selected]["Level"])
	$HpCurrent.text = str(Game.selectedINFOMon[get_parent().selected]["Health"])
	$HpMax.text = str(Game.selectedINFOMon[get_parent().selected]["MaxHealth"])
	
	for i in Game.selectedINFOMon[get_parent().selected]["Moves"]:
		var path = "Fight/GridContainer/Move " + str(((i) + 1))
		get_node(path).text = Game.selectedINFOMon[get_parent().selected]["Moves"][i]["Name"]
	
	for i in Game.selectedINFOMon:
		var path2 = "Switch/GridContainer/INFOmon " + str(((i) + 1))
		get_node(path2).text = Game.selectedINFOMon[i]["Name"]

func _on_run_pressed():
	$"../../Animation/AnimationPlayer".play("TransIn")
	await get_tree().create_timer(1.5).timeout
	get_parent().queue_free()
	get_tree().paused = false
	$"../../Animation/AnimationPlayer".play("TransOut")


func _on_switch_pressed():
	$Menu.hide()
	$Switch.show()
	$Fight.hide()
	$"Switch/GridContainer/INFOmon 1".grab_focus()





func _on_move_pressed(extra_arg_0):
	if Game.selectedINFOMon[get_parent().selected]["Moves"][extra_arg_0]["Target"] == "Monster":
		$Fight.hide()
		var tempAtk = Game.selectedINFOMon[get_parent().selected]["Moves"]
		$"../Enemy".get_child(0).hit(tempAtk[extra_arg_0]["Damage"])
		$"../Action".text = "Your " + str(Game.selectedINFOMon[get_parent().selected]["Name"]) + " used " + str(tempAtk[extra_arg_0]["Name"]) + "."
		await get_tree().create_timer(1).timeout
		$"../Action".text = "Your " + str(Game.selectedINFOMon[get_parent().selected]["Name"]) + " has attacked for " + str(tempAtk[extra_arg_0]["Damage"]) + " Hp."
		await get_tree().create_timer(1).timeout
		$"../EnemyUI/HpBar".value -= tempAtk[extra_arg_0]["Damage"]
		if $"../EnemyUI/HpBar".value <= 0:
			$"../Action".text = "AI " + str($"../Enemy".get_child(0).name) + " has been defeated."
			await get_tree().create_timer(1).timeout
			$"../Enemy".get_child(0).death()
			await get_tree().create_timer(2).timeout
			$"../Action".text = "You gained " + str(expGained)
			Game.addEXP(expGained)
			await get_tree().create_timer(2).timeout
			$"../../Animation/AnimationPlayer".play("TransIn")
			await get_tree().create_timer(1.5).timeout
			get_parent().queue_free()
			get_tree().paused = false
			$"../../Animation/AnimationPlayer".play("TransOut")
		
			
		
		await get_tree().create_timer(2).timeout
		get_parent().MonsterTurn()
		await get_tree().create_timer(3).timeout
		
		if Game.selectedINFOMon[get_parent().selected]["Health"] <= 0:
			$"../Action".text = "Your " + str(Game.selectedINFOMon[get_parent().selected]["Name"]) + " has been defeated."
			await get_tree().create_timer(1).timeout
			$"../Player".get_child(0).death()
			await get_tree().create_timer(2).timeout
			$"../Action".text = "You fled the scene." 
			await get_tree().create_timer(2).timeout
			$"../../Animation/AnimationPlayer".play("TransIn")
			await get_tree().create_timer(1.5).timeout
			get_parent().queue_free()
			get_tree().paused = false
			$"../../Animation/AnimationPlayer".play("TransOut")
			Game.selectedINFOMon[get_parent().selected]["Health"] = Game.selectedINFOMon[get_parent().selected]["MaxHealth"]
		elif Game.selectedINFOMon[get_parent().selected]["Health"] >= 0:
			$Fight.show()
			$"Fight/GridContainer/Move 1".grab_focus()
		


func _on_capture_pressed():
	
	$"../Enemy".get_child(0).capture()
	await get_tree().create_timer(2).timeout
	$"../Action".text = "You caught " + str($"../Enemy".get_child(0).name)
	await get_tree().create_timer(2).timeout
	Game.addINFOMon($"../Enemy".get_child(0).name)
	
	$"../../Animation/AnimationPlayer".play("TransIn")
	await get_tree().create_timer(1.5).timeout
	get_parent().queue_free()
	get_tree().paused = false
	$"../../Animation/AnimationPlayer".play("TransOut")


