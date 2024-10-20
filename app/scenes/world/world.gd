extends Node2D


var dragging: bool = false
var drag_start: Vector2 = Vector2.ZERO
var select_rect: RectangleShape2D = RectangleShape2D.new()
var selected: Array = []

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if selected.size() == 0:
				dragging = true
				drag_start = event.position
			else:
				for item in selected:
					item.collider.target = event.position
					item.collider.selected = false
				selected = []
		elif dragging:
			dragging = false
			queue_redraw()
			var drag_end = event.position
			select_rect.extents = abs(drag_end - drag_start) / 2
			var space = get_world_2d().direct_space_state
			var query = PhysicsShapeQueryParameters2D.new()
			query.shape = select_rect
			query.collision_mask = 2
			query.transform = Transform2D(0, (drag_end + drag_start) /2)
			selected = space.intersect_shape(query)
			for item in selected:
				item.collider.selected = true
	if event is InputEventMouseMotion and dragging:
		queue_redraw()

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, get_global_mouse_position() - drag_start), Color.AQUA, false, 2.0)
