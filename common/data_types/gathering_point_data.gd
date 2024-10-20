class_name GatheringPointData
extends Resource

@export_category("Gathering point settings")
@export var name: String
@export var resource_type: String
@export var gathering_rate: float = 1.0
@export var max_capacity: int = 100
@export var workers_max: int = 5
@export var regeneration_rate: float = 0.0
@export var icon: Texture
