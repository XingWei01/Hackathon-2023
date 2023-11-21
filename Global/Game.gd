extends Node


func _ready():
	addINFOMon("Internet Explorer")
	
	addEnemy("Chrome")

var dataBaseINFOMons = {
	0:{
		"Name": "Chrome",
		"Health": 19,
		"MaxHealth": 19,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Attack": 14,
		"Defense": 6,
		"Scene": preload("res://Monsters/Chrome.tscn"),
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
	},
	1:{
		"Name": "Internet Explorer",
		"Health": 22,
		"MaxHealth": 22,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Attack": 7,
		"Defense": 11,
		"Scene": preload("res://Monsters/internet_explorer.tscn"),
		"Moves": {
			0:{
				"Name": "Legacy Blast",
				"Target": "Monster",
				"Damage": 5,
				"cost": 1,
			},
			1:{
				"Name": "Nostalgia Beam",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2,
			},
			2:{
				"Name": "Popup Barrage",
				"Target": "Monster",
				"Damage": 15,
				"cost": 2,
			}
		}
	},
	2:{
		"Name": "Python",
		"Health": 20,
		"MaxHealth": 20,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Attack": 9,
		"Defense": 8,
		"Scene": preload("res://Monsters/python.tscn"),
		"Moves": {
			0:{
				"Name": "Syntax Strike",
				"Target": "Monster",
				"Damage": 5,
				"cost": 1,
			},
			1:{
				"Name": "Library Surge",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2,
			},
			2:{
				"Name": "List Slice Strike",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2,
			}
		}
	},
	3:{
		"Name": "C",
		"Health": 21,
		"MaxHealth": 21,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Attack": 10,
		"Defense": 7,
		"Scene": preload("res://Monsters/c.tscn"),
		"Moves": {
			0:{
				"Name": "Pointer Strike",
				"Target": "Monster",
				"Damage": 5,
				"cost": 1,
			},
			1:{
				"Name": "Memory Allocation Slam",
				"Target": "Monster",
				"Damage": 12,
				"cost": 2,
			},
			2:{
				"Name": "Code Compile",
				"Target": "Monster",
				"Damage": 8,
				"cost": 2,
			}
		}
	},
}

var selectedINFOMon = {
	
}

var selectedEnemy = {
	
}

func addINFOMon(Name):
	for i in dataBaseINFOMons:
		if dataBaseINFOMons[i]["Name"] == Name:
			var temp = dataBaseINFOMons[i].duplicate(true)
			selectedINFOMon[selectedINFOMon.size()] = temp
			
func addEnemy(Name):
	for i in dataBaseINFOMons:
		if dataBaseINFOMons[i]["Name"] == Name:
			var temp = dataBaseINFOMons[i].duplicate(true)
			selectedEnemy[selectedEnemy.size()] = temp

func addEXP(amount):
	for i in selectedINFOMon:
		selectedINFOMon[i]["Exp"] += amount
		if selectedINFOMon[i]["Exp"] >= selectedINFOMon[i]["MaxExp"]:
			selectedINFOMon[i]["Level"] += 1
			selectedINFOMon[i]["Exp"] = 0
			selectedINFOMon[i]["MaxExp"] = selectedINFOMon[i]["MaxExp"]*1.5
			selectedINFOMon[i]["Health"] = selectedINFOMon[i]["Health"]+ ((selectedINFOMon[i]["Level"])*1.5)
