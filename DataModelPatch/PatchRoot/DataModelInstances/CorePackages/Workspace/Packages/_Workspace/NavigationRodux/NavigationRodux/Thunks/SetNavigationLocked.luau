local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local ApplySetNavigationLockedModule = require(NavigationRodux.Actions.ApplySetNavigationLocked)
local ArgCheckModule = require(NavigationRodux.Parent.ArgCheck)

return function(p1)
	-- upvalues: ArgCheckModule (copy), ApplySetNavigationLockedModule (copy)
	ArgCheckModule.isType(p1, "boolean", "locked")
	
	return function(p2)
		-- upvalues: ApplySetNavigationLockedModule (upval), p1 (copy)
		p2:dispatch(ApplySetNavigationLockedModule(p1))
	end
end