local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local MessageGroupShapeModule = require(script.Parent.Parent.Grouping.MessageGroupShape)
local GetGroupCornerRadiiModule = require(script.Parent.Parent.Grouping.getGroupCornerRadii)
local config = {
	[ChatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE] = MessageGroupShapeModule.Position.Only,
	[ChatBubbleEnumModule.BUBBLE_VARIANTS.TOP] = MessageGroupShapeModule.Position.First,
	[ChatBubbleEnumModule.BUBBLE_VARIANTS.MIDDLE] = MessageGroupShapeModule.Position.Middle,
	[ChatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM] = MessageGroupShapeModule.Position.Last
}

return function(p1, p2, p3) --[[ Line: 14 | Named "getChatBubbleCornerRadii" ]]
	-- upvalues: GetGroupCornerRadiiModule (copy), MessageGroupShapeModule (copy), config (copy)
	return GetGroupCornerRadiiModule({
		direction = if p2 then MessageGroupShapeModule.Direction.Incoming else MessageGroupShapeModule.Direction.Outgoing,
		position = config[p1]
	}, p3)
end