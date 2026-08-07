local roactNavigationModule = require(script:FindFirstAncestor("FriendsLanding").Parent.RoactNavigation)

local function _(p0) --[[ line: 16 | named "getUpdatedNavigation" ]]
	local key
	local var1 = p0._dangerouslyGetParent()
	
	if var1 then
		key = p0.state and (p0.state.key and (var1.getChildNavigation(p0.state.key) or p0))
	end
	return key
end

return function(p1) --[[ line: 31 ]]
	-- upvalues: roactNavigationModule (ref)
	local key
	local var3 = p1._dangerouslyGetParent()
	
	if var3 then
		key = p1.state and (p1.state.key and (var3.getChildNavigation(p1.state.key) or p1))
	end
	return roactNavigationModule.getActiveChildNavigationOptions(key)
end