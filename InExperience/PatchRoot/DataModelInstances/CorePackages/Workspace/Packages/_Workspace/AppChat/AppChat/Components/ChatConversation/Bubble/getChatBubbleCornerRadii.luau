local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)

return function(p0, p1, p2) --[[ line: 10 | named "getChatBubbleCornerRadii" ]]
	-- upvalues: chatBubbleEnumModule (ref)
	if p0 == chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then
		return {
			topLeft = p2,
			topRight = p2,
			bottomLeft = p2,
			bottomRight = p2
		}
	end
	local var1 = if p0 == chatBubbleEnumModule.BUBBLE_VARIANTS.TOP then p2 else 0
	local var2 = if p0 == chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then p2 else 0
	
	return if p1 then {
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