local Parent = script:FindFirstAncestor("DiscoveryUtils").Parent

return function()
	-- upvalues: Parent (copy)
	local DisplayStore = require(Parent.Display).GetDisplayStore(false)
	local ViewportSize = DisplayStore.getViewportSize(false)
	
	if ViewportSize.X <= 1 or ViewportSize.Y <= 1 then
		return nil
	end
	local PlatformScale: number = DisplayStore.getPlatformScale(false)
	
	if PlatformScale and PlatformScale > 0 then
		ViewportSize /= PlatformScale
	end
	return ViewportSize
end