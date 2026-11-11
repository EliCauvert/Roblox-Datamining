local RoactNavigationModule = require(game:GetService("CorePackages").Packages.RoactNavigation)

local function _(p1)
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	
	return DangerouslyGetParentResult and p1.state and p1.state.key and DangerouslyGetParentResult.getChildNavigation(p1.state.key) or p1
end

return function(p1)
	-- upvalues: RoactNavigationModule (copy)
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	
	return RoactNavigationModule.getActiveChildNavigationOptions(DangerouslyGetParentResult and p1.state and p1.state.key and DangerouslyGetParentResult.getChildNavigation(p1.state.key) or p1)
end