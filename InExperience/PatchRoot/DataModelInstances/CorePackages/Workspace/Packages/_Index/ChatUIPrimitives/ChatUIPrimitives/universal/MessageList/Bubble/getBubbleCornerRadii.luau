local _ = require(script.Parent.Parent.groupMessages)
local _ = require(script.Parent.Types)

return function(p1, p2, BottomLeft) --[[ Line: 8 | Named "getBubbleCornerRadii" ]]
	local BottomLeft1 = if p1.isFirst then BottomLeft else 0
	local BottomLeft2 = if p1.isLast then BottomLeft else 0
	
	return if p2 == "left" then {
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