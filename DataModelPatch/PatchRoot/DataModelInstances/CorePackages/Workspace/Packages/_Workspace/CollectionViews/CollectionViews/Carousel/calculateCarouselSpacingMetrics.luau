local CalculateSpacePerItemModule = require(script:FindFirstAncestor("CollectionViews").calculateSpacePerItem)

return function(ContainerWidth, p1: number, p2, p3, p4, p5)
	-- upvalues: CalculateSpacePerItemModule (copy)
	if p1 <= 0 then
		return {
			effectiveWidth = 0,
			stride = 0,
			renderedItemWidth = 0,
			renderedGap = 0,
			containerWidth = ContainerWidth
		}
	else
		local ContainerWidthDelta = ContainerWidth - p3 - p4 * p5
		local SpacePerItemModule = CalculateSpacePerItemModule(p1, p2)
		local FlooredDelta = math.floor(ContainerWidthDelta / p1 + 0.5) - SpacePerItemModule.gapOffsetPerItem
		local Floored = math.floor(SpacePerItemModule.adjustedGap + 0.5)
		
		return {
			containerWidth = ContainerWidth,
			effectiveWidth = ContainerWidthDelta,
			stride = FlooredDelta + Floored,
			renderedItemWidth = FlooredDelta,
			renderedGap = Floored
		}
	end
end