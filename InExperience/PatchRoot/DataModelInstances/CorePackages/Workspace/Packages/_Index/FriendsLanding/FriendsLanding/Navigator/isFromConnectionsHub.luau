local appPage = require(script:FindFirstAncestor("FriendsLanding").Parent.RobloxAppEnums).AppPage

return function(p1)
	-- upvalues: appPage (ref)
	local var1 = p1._dangerouslyGetParent()
	
	if var1 then
		local var2 = var1._dangerouslyGetParent()
		
		return if var2 then var2.state.routeName == appPage.CoHubMyConnections else false
	end
end