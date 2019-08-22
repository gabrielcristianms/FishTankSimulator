extends Sprite

var direction            = 1
export var normalSpeed   = 50
export var foodRadarSize = 100
var currentSpeed         = 50
var lookingAtFood        = false
var currentState         = "normal"
var currentFood          = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentSpeed > normalSpeed:
		currentSpeed = currentSpeed - (100 * delta)
		
	if position.x < 0 or position.x > 400:
		direction = direction * -1
	
	if currentState == "normal":
		normal_state(delta)
	elif currentState == "observando":
		watching_state(delta)
	elif currentState == "cheio":
		full_state(delta)
	elif currentState == "faminto":
		starving_state(delta)
	elif currentState == "morto":
		dead_state(delta)
	
	

func normal_state(delta):
	position.x = position.x + (currentSpeed * delta * direction)

func watching_state(delta):
	var foodDirection = (currentFood.position - position).normalized()
	position += currentSpeed * delta * foodDirection
	
func full_state(delta):
	pass
	
func starving_state(delta):
	pass
	
func dead_state(delta):
	flip_v = true
	pass
	
func get_food_radar_size():
	if currentState == "faminto":
		return 2 * foodRadarSize
	elif currentState == "cheio":
		return 0.5 * foodRadarSize
	else:
		return foodRadarSize

func _on_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#direction  = direction * -1
		currentSpeed = 400

func look_at_food(food):
	currentState = "observando"
	currentFood  = food
	look_at(food.position)
	flip_h = false
	lookingAtFood = true
	
func look_straight():
	currentState = "normal"
	currentFood  = null
	rotation = 0
	flip_v = false
	lookingAtFood = false