extends Sprite

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var state_machine = get_node("AnimationTree")

var input = doorclosed()

func doorclosed():
	state_machine.start('CloseUp')
	
