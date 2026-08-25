local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local applySetNavigationLockedModule = require(navigationRodux.Actions.ApplySetNavigationLocked)
local argCheckModule = require(navigationRodux.Parent.ArgCheck)

return function(p0)
	-- upvalues: argCheckModule (ref), applySetNavigationLockedModule (ref)
	argCheckModule.isType(p0, "boolean", "locked")
	
	return function(p1)
		-- upvalues: applySetNavigationLockedModule (copy), p0 (ref)
		p1:dispatch(applySetNavigationLockedModule(p0))
	end
end