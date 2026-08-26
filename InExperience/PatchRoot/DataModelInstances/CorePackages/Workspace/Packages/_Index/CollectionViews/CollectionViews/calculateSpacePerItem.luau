local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1, p2)
	-- upvalues: argCheckModule (ref)
	if p1 <= 1 then
		return { gapOffsetPerItem = 0, adjustedGap = p2 }
	end
	argCheckModule.assert(p1 >= 2)
	local var1 = p1 - 1
	local floored = math.floor(var1 / p1 * p2)
	
	return {
		gapOffsetPerItem = floored,
		adjustedGap = p2 + (floored * p1 - p2 * var1) / var1
	}
end