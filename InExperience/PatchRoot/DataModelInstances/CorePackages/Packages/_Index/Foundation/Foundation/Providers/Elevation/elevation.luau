local ElevationLayerModule = require(script:FindFirstAncestor("Foundation").Enums.ElevationLayer)
local config = {
	[ElevationLayerModule.Popover] = { start = 4, finish = 99, step = 1 },
	[ElevationLayerModule.Drawer] = { start = 100, finish = 199, step = 10 },
	[ElevationLayerModule.Sheet] = { start = 200, finish = 299, step = 10 },
	[ElevationLayerModule.Dialog] = { start = 300, finish = 399, step = 10 },
	[ElevationLayerModule.Notification] = { start = 400, finish = 499, step = 1 }
}

return {
	ELEVATION_LAYERS = config,
	getRelativeIndex = function(p1) --[[ Line: 23 ]]
		-- upvalues: config (copy)
		return p1.zIndex - config[p1.layer].start
	end
}