local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)

return DependenciesModule.Rodux.createReducer({}, {
	[DependenciesModule.FriendsNetworking.GetInactiveFriends.Succeeded.name] = function(_, p1)
		local t = {}
		
		for _, entry in pairs(p1.responseBody.data) do
			t[tostring(entry.id)] = true
		end
		return t
	end
})