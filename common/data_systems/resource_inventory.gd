class_name ResourceInventory
extends Object

var resources: Dictionary = {}

func add_resource(resource: String, amount: int) -> void:
    if resources.has(resource):
        resources[resource] += amount
    else:
        resources[resource] = amount

func consume_resource(resource: String, amount: int) -> bool:
    if resources[resource] >= amount:
        resources[resource] -= amount
        return true
    return false

func get_resource_amount(resource: String) -> int:
    return resources.get(resource, 0)
