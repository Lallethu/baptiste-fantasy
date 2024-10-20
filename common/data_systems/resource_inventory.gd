class_name ResourceInventory
extends Object

var resources: Dictionary = {}

func add_resource(resource: ResourceData, amount: int) -> void:
    if resource.name in resources:
        resources[resource.name] += amount
    else:
        resources[resource.name] = amount

func consume_resource(resource: ResourceData, amount: int) -> bool:
    if resource.name in resources and resources[resource.name] >= amount:
        resources[resource.name] -= amount
        return true
    return false

func get_resource_amount(resource: ResourceData) -> int:
    return resources.get(resource.name, 0)
