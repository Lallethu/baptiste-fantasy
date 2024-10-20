extends CharacterBody2D

@export_category("Unit settings")
@export var unit_data: UnitData


var avoidance: Vector2 = Vector2.ZERO
var avoidance_strength: float = 0.1
var target_radius: float = 25.0

var selected: bool = false:
	set = set_selected
func set_selected(value: bool):
	selected = value
	if selected:
		$Sprite2D.self_modulate = Color.AQUA
	else:
		$Sprite2D.self_modulate = Color.WHITE

var target = null:
	set = set_target
func set_target(value):
	target = value


func avoid():
	var result: Vector2 = Vector2.ZERO
	var neighbors = $AvoidanceCollider.get_overlapping_bodies()
	
	if neighbors:
		for n: PhysicsBody2D in neighbors:
			result += n.position.direction_to(position)
		result /= neighbors.size()
	return result.normalized()


#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("set_target"):
		#target = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if target != null:
		velocity = position.direction_to(target)
		if position.distance_to(target) < target_radius:
			target = null
	
	avoidance = avoid()
	velocity = (velocity + avoidance * avoidance_strength).normalized() * unit_data.speed
	move_and_collide(velocity * delta)
	
	if velocity != Vector2.ZERO:
		$AnimationPlayer.play("running")
	else:
		$AnimationPlayer.play("idle")
