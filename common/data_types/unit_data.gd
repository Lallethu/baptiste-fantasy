class_name UnitData
extends Resource

@export_category("Unit settings")
@export var name: String
@export var speed: float = 1.0
@export var max_health: int = 100
@export var attack_power: int = 10
@export var attack_range: float = 1.5
@export var experience_max: float = 1.75
@export var creation_time: int
@export var is_worker: bool = false

@export var resources_cost: Dictionary = {
	"wood": 50,
	"gold": 25
}
