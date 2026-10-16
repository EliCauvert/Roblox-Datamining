local AppPage = require(script:FindFirstAncestor("FriendsLanding").Parent.RobloxAppEnums).AppPage

return function(p1): boolean --[[ Line: 7 | Named "getLuaAppsNavigator" ]]
	-- upvalues: AppPage (copy)
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	
	if DangerouslyGetParentResult then
		local DangerouslyGetParentResult1 = DangerouslyGetParentResult._dangerouslyGetParent()
		
		if DangerouslyGetParentResult1 then
			return DangerouslyGetParentResult1.state.routeName == AppPage.CoHubMyConnections
		end
	end
	return false
end