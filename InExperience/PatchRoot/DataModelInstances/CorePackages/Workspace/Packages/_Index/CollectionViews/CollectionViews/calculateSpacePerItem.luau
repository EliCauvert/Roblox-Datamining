local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p0, p1)
	-- upvalues: argCheckModule (ref)
	if p0 <= 1 then
		return { gapOffsetPerItem = 0, adjustedGap = p1 }
	end
	argCheckModule.assert(p0 >= 2)
	local var1 = p0 - 1
	local floored = math.floor(var1 / p0 * p1)
	
	return {
		gapOffsetPerItem = floored,
		adjustedGap = p1 + (floored * p0 - p1 * var1) / var1
	}
end