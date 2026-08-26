local roactNavigationModule = require(script:FindFirstAncestor("FriendsLanding").Parent.RoactNavigation)

local function _(p1)
	local key
	local var1 = p1._dangerouslyGetParent()
	
	if var1 then
		key = p1.state and (p1.state.key and (var1.getChildNavigation(p1.state.key) or p1))
	end
	return key
end

return function(p1)
	-- upvalues: roactNavigationModule (ref)
	local key
	local var1 = p1._dangerouslyGetParent()
	
	if var1 then
		key = p1.state and (p1.state.key and (var1.getChildNavigation(p1.state.key) or p1))
	end
	return roactNavigationModule.getActiveChildNavigationOptions(key)
end