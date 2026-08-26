local calculateSpacePerItemModule = require(script:FindFirstAncestor("CollectionViews").calculateSpacePerItem)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: calculateSpacePerItemModule (ref)
	if p2 <= 0 then
		return {
			effectiveWidth = 0,
			stride = 0,
			renderedItemWidth = 0,
			renderedGap = 0,
			containerWidth = p1
		}
	end
	local var1 = p1 - p4 - p5 * p6
	local var2 = calculateSpacePerItemModule(p2, p3)
	local var3 = math.floor(var1 / p2 + 0.5) - var2.gapOffsetPerItem
	local floored = math.floor(var2.adjustedGap + 0.5)
	
	return {
		containerWidth = p1,
		effectiveWidth = var1,
		stride = var3 + floored,
		renderedItemWidth = var3,
		renderedGap = floored
	}
end