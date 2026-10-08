local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local messageGroupShapeModule = require(script.Parent.Parent.Grouping.MessageGroupShape)
local getGroupCornerRadiiModule = require(script.Parent.Parent.Grouping.getGroupCornerRadii)
local t = {
	[chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE] = messageGroupShapeModule.Position.Only,
	[chatBubbleEnumModule.BUBBLE_VARIANTS.TOP] = messageGroupShapeModule.Position.First,
	[chatBubbleEnumModule.BUBBLE_VARIANTS.MIDDLE] = messageGroupShapeModule.Position.Middle,
	[chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM] = messageGroupShapeModule.Position.Last
}

return function(p1, p2, p3)
	-- upvalues: getGroupCornerRadiiModule (ref), messageGroupShapeModule (ref), t (ref)
	return getGroupCornerRadiiModule({
		direction = if p2 then messageGroupShapeModule.Direction.Incoming else messageGroupShapeModule.Direction.Outgoing,
		position = t[p1]
	}, p3)
end