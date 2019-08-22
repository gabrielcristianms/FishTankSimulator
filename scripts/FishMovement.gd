extends Sprite

var direction           = 1
export var normalSpeed  = 50
var currentSpeed        = 50
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentSpeed > normalSpeed:
		currentSpeed = currentSpeed - (100 * delta)
		
	if position.x < 0 or position.x > 400:
		direction = direction * -1
		flip_h = direction == -1
	
	position.x = position.x + (currentSpeed * delta * direction)

func _on_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		#direction  = direction * -1
		currentSpeed = 400
