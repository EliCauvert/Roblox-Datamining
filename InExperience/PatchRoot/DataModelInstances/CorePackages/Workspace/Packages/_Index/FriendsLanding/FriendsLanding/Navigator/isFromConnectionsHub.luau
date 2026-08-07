local appPage = require(script:FindFirstAncestor("FriendsLanding").Parent.RobloxAppEnums).AppPage

return function(p0) --[[ line: 7 | named "getLuaAppsNavigator" ]]
	-- upvalues: appPage (ref)
	local var0 = p0._dangerouslyGetParent()
	
	if var0 then
		local var1 = var0._dangerouslyGetParent()
		
		return if var1 then var1.state.routeName == appPage.CoHubMyConnections else false
	end
end