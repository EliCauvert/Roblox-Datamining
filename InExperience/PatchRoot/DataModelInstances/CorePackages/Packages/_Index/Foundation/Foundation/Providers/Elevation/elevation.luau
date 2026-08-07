local elevationLayerModule = require(script:FindFirstAncestor("Foundation").Enums.ElevationLayer)
local t = {
	[elevationLayerModule.Popover] = { start = 4, finish = 99, step = 1 },
	[elevationLayerModule.Drawer] = { start = 100, finish = 199, step = 10 },
	[elevationLayerModule.Sheet] = { start = 200, finish = 299, step = 10 },
	[elevationLayerModule.Dialog] = { start = 300, finish = 399, step = 10 },
	[elevationLayerModule.Notification] = { start = 400, finish = 499, step = 1 }
}

return {
	ELEVATION_LAYERS = t,
	getRelativeIndex = function(p0) --[[ line: 23 ]]
		-- upvalues: t (ref)
		return p0.zIndex - t[p0.layer].start
	end
}