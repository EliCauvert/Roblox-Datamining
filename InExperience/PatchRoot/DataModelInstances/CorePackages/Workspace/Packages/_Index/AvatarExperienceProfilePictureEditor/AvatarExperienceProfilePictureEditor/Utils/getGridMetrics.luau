local config = { minimumItemsPerRow = 4, minimumItemWidth = 140 }
local CustomMetricsGetter = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.UIBlox).App.Grid.GridMetrics.makeCustomMetricsGetter(config)

return function(p1) --[[ Line: 28 | Named "getGridMetrics" ]]
	-- upvalues: config (copy), CustomMetricsGetter (copy)
	local Largest = math.max(0, math.max(0, p1.containerWidth - p1.horizontalPadding * 2) - p1.strokeInset * 2)
	
	if Largest <= 0 then
		return {
			itemsPerRow = config.minimumItemsPerRow,
			itemWidth = p1.minTileSize
		}
	else
		local CustomMetricsGetterResult = CustomMetricsGetter(Largest, p1.gap)
		
		return if CustomMetricsGetterResult.itemWidth < config.minimumItemWidth then {
			itemsPerRow = CustomMetricsGetterResult.itemsPerRow,
			itemWidth = config.minimumItemWidth
		} else CustomMetricsGetterResult
	end
end