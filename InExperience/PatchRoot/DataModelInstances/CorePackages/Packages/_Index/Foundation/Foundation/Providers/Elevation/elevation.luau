local Foundation = script:FindFirstAncestor("Foundation")
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local Config = if require(Foundation.Utility.Flags).FoundationFloatingElevationLayer then {
	[ElevationLayerModule.Popover] = { start = 4, finish = 99, step = 1 },
	[ElevationLayerModule.Floating] = { start = 100, finish = 199, step = 10 },
	[ElevationLayerModule.Drawer] = { start = 200, finish = 299, step = 10 },
	[ElevationLayerModule.Sheet] = { start = 300, finish = 399, step = 10 },
	[ElevationLayerModule.Dialog] = { start = 400, finish = 499, step = 10 },
	[ElevationLayerModule.Notification] = { start = 600, finish = 699, step = 1 }
} else {
	[ElevationLayerModule.Popover] = { start = 4, finish = 99, step = 1 },
	[ElevationLayerModule.Drawer] = { start = 100, finish = 199, step = 10 },
	[ElevationLayerModule.Sheet] = { start = 200, finish = 299, step = 10 },
	[ElevationLayerModule.Dialog] = { start = 300, finish = 399, step = 10 },
	[ElevationLayerModule.Notification] = { start = 400, finish = 499, step = 1 },
	[ElevationLayerModule.Floating] = { start = 500, finish = 599, step = 10 }
}

return {
	ELEVATION_LAYERS = Config,
	getRelativeIndex = function(p1)
		-- upvalues: Config (copy)
		return p1.zIndex - Config[p1.layer].start
	end
}