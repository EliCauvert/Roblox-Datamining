local deviceTier = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Devices).DeviceTier
local AXWidgetListWindowSizeLow = game:DefineFastInt("AXWidgetListWindowSizeLow", 5)
local AXWidgetListWindowSizeMid = game:DefineFastInt("AXWidgetListWindowSizeMid", 8)
local AXWidgetListWindowSizeHigh = game:DefineFastInt("AXWidgetListWindowSizeHigh", 11)

return function(p1)
	-- upvalues: deviceTier (ref), AXWidgetListWindowSizeLow (ref), AXWidgetListWindowSizeMid (ref), AXWidgetListWindowSizeHigh (ref)
	local deviceMemoryTier = deviceTier.GetDeviceMemoryTier()
	
	return if deviceMemoryTier == "LowEnd" then AXWidgetListWindowSizeLow elseif deviceMemoryTier == "MidTier" then AXWidgetListWindowSizeMid elseif deviceMemoryTier == "HighEnd" then AXWidgetListWindowSizeHigh else p1
end