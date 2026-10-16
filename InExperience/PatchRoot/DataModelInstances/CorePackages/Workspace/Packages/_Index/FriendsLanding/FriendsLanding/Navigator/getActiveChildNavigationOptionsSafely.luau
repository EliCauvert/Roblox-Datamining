local RoactNavigationModule = require(script:FindFirstAncestor("FriendsLanding").Parent.RoactNavigation)

local function _(p1) --[[ Line: 16 | Named "getUpdatedNavigation" ]]
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	
	return DangerouslyGetParentResult and p1.state and p1.state.key and DangerouslyGetParentResult.getChildNavigation(p1.state.key) or p1
end

return function(p1) --[[ Line: 31 ]]
	-- upvalues: RoactNavigationModule (copy)
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	
	return RoactNavigationModule.getActiveChildNavigationOptions(DangerouslyGetParentResult and p1.state and p1.state.key and DangerouslyGetParentResult.getChildNavigation(p1.state.key) or p1)
end