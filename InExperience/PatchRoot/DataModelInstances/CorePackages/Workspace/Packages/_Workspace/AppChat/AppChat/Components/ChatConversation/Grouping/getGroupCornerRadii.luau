local messageGroupShapeModule = require(script.Parent.MessageGroupShape)
local direction = messageGroupShapeModule.Direction
local position = messageGroupShapeModule.Position

return function(p1, p2)
	-- upvalues: position (ref), direction (ref)
	if p1.position == position.Only then
		return {
			topLeft = p2,
			topRight = p2,
			bottomLeft = p2,
			bottomRight = p2
		}
	end
	local var1 = if p1.position == position.First then p2 else 0
	local var2 = if p1.position == position.Last then p2 else 0
	
	return if p1.direction == direction.Incoming then {
		topLeft = var1,
		topRight = p2,
		bottomLeft = var2,
		bottomRight = p2
	} else {
		topLeft = p2,
		topRight = var1,
		bottomLeft = p2,
		bottomRight = var2
	}
end