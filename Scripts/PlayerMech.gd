extends Mech

class_name PlayerMech

# this will be instantiated in scene

# this is saying this constructor should pass its inputs
# up to the parent's constructor
func _init(_mechHealth: int, _mechParts: Dictionary):
	super._init(_mechHealth, _mechParts)

# virtual overrides
func attack():
	print("player attacks")