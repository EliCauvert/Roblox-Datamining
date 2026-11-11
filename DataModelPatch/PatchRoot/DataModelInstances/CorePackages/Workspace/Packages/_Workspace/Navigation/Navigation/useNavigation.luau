local Parent = script:FindFirstAncestor("Navigation").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)

return function()
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	return ReactModule.useContext(RoactNavigationModule.Context)
end