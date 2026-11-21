local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DisplayModule = require(Parent.Display)
local _ = require(Parent.Signals)

return function(p1): boolean
	-- upvalues: DisplayModule (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(p1)
	local ViewportSize = DisplayStore.getViewportSize(p1)
	
	return DisplayStore.getDisplaySize(p1) == Enum.DisplaySize.Small and ViewportSize.X <= ViewportSize.Y
end