local t = { minimumItemsPerRow = 4, minimumItemWidth = 140 }
local var1 = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.UIBlox).App.Grid.GridMetrics.makeCustomMetricsGetter(t)

return function(p1)
	-- upvalues: t (ref), var1 (ref)
	local maxValue = math.max(0, math.max(0, p1.containerWidth - p1.horizontalPadding * 2) - p1.strokeInset * 2)
	
	if maxValue <= 0 then
		return {
			itemsPerRow = t.minimumItemsPerRow,
			itemWidth = p1.minTileSize
		}
	end
	local var2 = var1(maxValue, p1.gap)
	
	return if var2.itemWidth < t.minimumItemWidth then {
		itemsPerRow = var2.itemsPerRow,
		itemWidth = t.minimumItemWidth
	} else var2
end