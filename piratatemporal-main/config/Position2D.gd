extends Position2D

onready var position2D=$Position2D
if direction>0:
	position2D.scale.x=1
	
elif direction<0:
	position2D.scale.x=-1
