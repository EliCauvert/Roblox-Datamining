local DeviceType = require(script:FindFirstAncestor("AppBlox").Parent.RobloxAppEnums).DeviceType
local config = {
	[DeviceType.Desktop] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[DeviceType.Tablet] = {
		startingOffsetPosition = 200,
		thumbnailHeight = 150,
		dualPanelBreakpoint = 1e999,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[DeviceType.Phone] = {
		startingOffsetPosition = 250,
		thumbnailHeight = 100,
		dualPanelBreakpoint = 1e999,
		headerBarBackgroundHeight = 24,
		sideMargin = 24
	},
	[DeviceType.Console] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	},
	[DeviceType.VR] = {
		startingOffsetPosition = 500,
		thumbnailHeight = 200,
		dualPanelBreakpoint = 1280,
		headerBarBackgroundHeight = 80,
		sideMargin = 48
	}
}

return function(p1) --[[ Line: 60 | Named "getPlatformConfig" ]]
	-- upvalues: config (copy), DeviceType (copy)
	local Entry = config[p1]
	
	return if Entry == nil then config[DeviceType.Desktop] else Entry
end