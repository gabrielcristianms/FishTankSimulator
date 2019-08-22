extends Node2D

const Fish = preload("res://scenes/peixe.tscn")
const Food = preload("res://scenes/Comida.tscn")

var fishes = []
var foods  = []

func _process(delta):
	for fish in fishes:
		for food in foods:
			var distance = (fish.position - food.position).length()
			if distance <= fish.get_food_radar_size():
				fish.look_at_food(food)
			else:
				fish.look_straight()
		
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 2:
		var fish = Fish.instance()
		fish.position = event.position
		fishes.append(fish)
		add_child(fish)
		
	if event is InputEventMouseButton and event.pressed and event.button_index == 3:
		var food = Food.instance()
		food.position = event.position
		foods.append(food)
		add_child(food)