extends CanvasLayer

var Chrome = preload("res://Monsters/Chrome.tscn")
var INFOmonName = "Chrome"
var INFOmonMoves = {
	"Moves": {
			0:{
				"Name": "Quick Surf",
				"Target": "Monster",
				"Damage": 5,
				"cost": 1,
			},
			1:{
				"Name": "Tab Switch Strike",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2,
			},
			2:{
				"Name": "WebAssembly Wave",
				"Target": "Monster",
				"Damage": 15,
				"cost": 2,
			}
		}
}

var AImove = 0
var iter = 100000

var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var temp = Chrome.instantiate()
	$Enemy.add_child(temp)
	
	$Action.text = "A wild " + str(INFOmonName) + " has appeared."
	
	$UI/Menu.hide()
	$UI/Fight.hide()
	$UI/Switch.hide()
	$UI/Menu/GridContainer/Attack.grab_focus()

	await get_tree().create_timer(1.2).timeout
	
	
	for i in Game.selectedINFOMon:
		var monTemp = Game.selectedINFOMon[i]["Scene"].instantiate()
		monTemp.name = Game.selectedINFOMon[i]["Name"]
		monTemp.hide()
		$Player.add_child(monTemp)
		$Action.text = "You sent out " + str(monTemp.name) 
	
	
	$Player.get_child(0).show()
	
	await get_tree().create_timer(1).timeout
	
	$UI/Menu.show()
	$Action.text = "It's your turn to move." 
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func iteration():
	for i in iter:
		AImove = randi_range(0,2)

func MonsterTurn():
	var tempATK = INFOmonMoves["Moves"][AImove] 
	$Player.get_child(selected).hit(tempATK["Damage"])
	$Action.text = "AI "+ str(INFOmonName) + " used " + str(tempATK["Name"]) + "."
	await get_tree().create_timer(1).timeout
	$Action.text = "AI " + str(INFOmonName) + " has attacked for " + str(tempATK["Damage"]) + " Hp."
	Game.selectedINFOMon[selected]["Health"] -= tempATK["Damage"]
	$UI/HpBar.value = Game.selectedINFOMon[selected]["Health"]
	await get_tree().create_timer(2.45).timeout
	$Action.text = "It's your move."


