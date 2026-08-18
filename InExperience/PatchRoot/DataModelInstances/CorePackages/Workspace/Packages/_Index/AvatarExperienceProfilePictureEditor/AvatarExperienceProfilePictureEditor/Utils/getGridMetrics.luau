local t = { minimumItemsPerRow = 4, minimumItemWidth = 140 }
local var1 = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.UIBlox).App.Grid.GridMetrics.makeCustomMetricsGetter(t)

return function(p0) --[[ line: 28 | named "getGridMetrics" ]]
	-- upvalues: t (ref), var1 (ref)
	local maxValue = math.max(0, math.max(0, p0.containerWidth - p0.horizontalPadding * 2) - p0.strokeInset * 2)
	
	if maxValue <= 0 then
		return {
			itemsPerRow = t.minimumItemsPerRow,
			itemWidth = p0.minTileSize
		}
	end
	local var3 = var1(maxValue, p0.gap)
	
	return if var3.itemWidth < t.minimumItemWidth then {
		itemsPerRow = var3.itemsPerRow,
		itemWidth = t.minimumItemWidth
	} else var3
end