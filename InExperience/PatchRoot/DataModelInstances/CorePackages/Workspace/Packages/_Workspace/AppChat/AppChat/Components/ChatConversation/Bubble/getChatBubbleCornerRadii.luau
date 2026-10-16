local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)

return function(p1, p2, p3)
	-- upvalues: chatBubbleEnumModule (ref)
	if p1 == chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then
		return {
			topLeft = p3,
			topRight = p3,
			bottomLeft = p3,
			bottomRight = p3
		}
	end
	local var1 = if p1 == chatBubbleEnumModule.BUBBLE_VARIANTS.TOP then p3 else 0
	local var2 = if p1 == chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then p3 else 0
	
	return if p2 then {
		topLeft = var1,
		topRight = p3,
		bottomLeft = var2,
		bottomRight = p3
	} else {
		topLeft = p3,
		topRight = var1,
		bottomLeft = p3,
		bottomRight = var2
	}
end