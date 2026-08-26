local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local applySetNavigationLockedModule = require(navigationRodux.Actions.ApplySetNavigationLocked)
local argCheckModule = require(navigationRodux.Parent.ArgCheck)

return function(p1)
	-- upvalues: argCheckModule (ref), applySetNavigationLockedModule (ref)
	argCheckModule.isType(p1, "boolean", "locked")
	
	return function(p2)
		-- upvalues: applySetNavigationLockedModule (copy), p1 (ref)
		p2:dispatch(applySetNavigationLockedModule(p1))
	end
end