local DeviceTier = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Devices).DeviceTier
local AXWidgetListWindowSizeLow = game:DefineFastInt("AXWidgetListWindowSizeLow", 5)
local AXWidgetListWindowSizeMid = game:DefineFastInt("AXWidgetListWindowSizeMid", 8)
local AXWidgetListWindowSizeHigh = game:DefineFastInt("AXWidgetListWindowSizeHigh", 11)

return function(p1) --[[ Line: 26 | Named "resolveWidgetListWindowSize" ]]
	-- upvalues: DeviceTier (copy), AXWidgetListWindowSizeLow (copy), AXWidgetListWindowSizeMid (copy), AXWidgetListWindowSizeHigh (copy)
	local DeviceMemoryTier = DeviceTier.GetDeviceMemoryTier()
	
	return if DeviceMemoryTier == "LowEnd" then AXWidgetListWindowSizeLow elseif DeviceMemoryTier == "MidTier" then AXWidgetListWindowSizeMid elseif DeviceMemoryTier == "HighEnd" then AXWidgetListWindowSizeHigh else p1
end