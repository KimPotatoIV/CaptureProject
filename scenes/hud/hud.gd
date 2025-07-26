extends CanvasLayer

##################################################
const MOVING_SPEED: float = 100.0

var label_node: Label

var is_moving_left: bool = false

##################################################
func _ready() -> void:
	label_node = $Label

##################################################
func _process(delta: float) -> void:
	if is_moving_left:
		label_node.position.x -= MOVING_SPEED * delta
	else:
		label_node.position.x += MOVING_SPEED * delta
	
	if label_node.position.x >= 400.0:
		is_moving_left = true
		
	if label_node.position.x <= 0.0:
		is_moving_left = false
