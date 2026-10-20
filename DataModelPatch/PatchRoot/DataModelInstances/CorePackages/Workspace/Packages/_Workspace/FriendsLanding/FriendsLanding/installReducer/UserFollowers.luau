local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)

return DependenciesModule.Rodux.createReducer({}, {
	[DependenciesModule.FriendsNetworking.GetUserFollowers.Succeeded.name] = function(_, p1)
		local t = {}
		
		for _, entry in ipairs(p1.responseBody.data) do
			t[tostring(entry.id)] = true
		end
		return t
	end
})