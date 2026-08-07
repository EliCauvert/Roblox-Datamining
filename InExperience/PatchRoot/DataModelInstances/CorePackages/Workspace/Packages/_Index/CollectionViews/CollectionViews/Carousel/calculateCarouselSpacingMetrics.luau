local calculateSpacePerItemModule = require(script:FindFirstAncestor("CollectionViews").calculateSpacePerItem)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 14 | named "calculateCarouselSpacingMetrics" ]]
	-- upvalues: calculateSpacePerItemModule (ref)
	if p1 <= 0 then
		return {
			effectiveWidth = 0,
			stride = 0,
			renderedItemWidth = 0,
			renderedGap = 0,
			containerWidth = p0
		}
	end
	local var1 = p0 - p3 - p4 * p5
	local var2 = calculateSpacePerItemModule(p1, p2)
	local var3 = math.floor(var1 / p1 + 0.5) - var2.gapOffsetPerItem
	local floored = math.floor(var2.adjustedGap + 0.5)
	
	return {
		containerWidth = p0,
		effectiveWidth = var1,
		stride = var3 + floored,
		renderedItemWidth = var3,
		renderedGap = floored
	}
end