local deviceType = require(script:FindFirstAncestor("AppBlox").Parent.RobloxAppEnums).DeviceType
local t = {
	[deviceType.Desktop] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[deviceType.Tablet] = {
		startingOffsetPosition = 200,
		thumbnailHeight = 150,
		dualPanelBreakpoint = 1e999,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[deviceType.Phone] = {
		startingOffsetPosition = 250,
		thumbnailHeight = 100,
		dualPanelBreakpoint = 1e999,
		headerBarBackgroundHeight = 24,
		sideMargin = 24
	},
	[deviceType.Console] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[deviceType.VR] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	}
}

return function(p0)
	-- upvalues: t (ref), deviceType (ref)
	local var1 = t[p0]
	
	return if var1 == nil then t[deviceType.Desktop] else var1
end