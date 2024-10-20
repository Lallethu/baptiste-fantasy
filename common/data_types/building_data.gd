class_name BuildingData
extends Resource

@export_category("Building settings")
@export var name: String
@export var texture: Texture
@export var width: int = 1
@export var height: int = 1
@export var building_time_required: int = 10
@export var is_building_head_querter: bool = false
@export var is_building_enemy: bool = false

# Dictionnaire contenant les coûts des ressources
@export var resources_required: Dictionary = {
	"stone": 100,
	"wood": 50
}
