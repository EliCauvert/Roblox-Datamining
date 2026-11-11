local ArgCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1: number, AdjustedGap)
	-- upvalues: ArgCheckModule (copy)
	if p1 <= 1 then
		return { gapOffsetPerItem = 0, adjustedGap = AdjustedGap }
	else
		ArgCheckModule.assert(p1 >= 2)
		local v1 = p1 - 1
		local Floored = math.floor(v1 / p1 * AdjustedGap)
		
		return {
			gapOffsetPerItem = Floored,
			adjustedGap = AdjustedGap + (Floored * p1 - AdjustedGap * v1) / v1
		}
	end
end