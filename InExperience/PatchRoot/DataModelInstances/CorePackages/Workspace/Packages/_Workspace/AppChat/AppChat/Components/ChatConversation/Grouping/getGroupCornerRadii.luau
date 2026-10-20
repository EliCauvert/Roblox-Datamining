local MessageGroupShapeModule = require(script.Parent.MessageGroupShape)
local Direction = MessageGroupShapeModule.Direction
local Position = MessageGroupShapeModule.Position

return function(p1, BottomLeft)
	-- upvalues: Position (copy), Direction (copy)
	if p1.position == Position.Only then
		return {
			topLeft = BottomLeft,
			topRight = BottomLeft,
			bottomLeft = BottomLeft,
			bottomRight = BottomLeft
		}
	else
		local BottomLeft1 = if p1.position == Position.First then BottomLeft else 0
		local BottomLeft2 = if p1.position == Position.Last then BottomLeft else 0
		
		return if p1.direction == Direction.Incoming then {
			topLeft = BottomLeft1,
			topRight = BottomLeft,
			bottomLeft = BottomLeft2,
			bottomRight = BottomLeft
		} else {
			topLeft = BottomLeft,
			topRight = BottomLeft1,
			bottomLeft = BottomLeft,
			bottomRight = BottomLeft2
		}
	end
end