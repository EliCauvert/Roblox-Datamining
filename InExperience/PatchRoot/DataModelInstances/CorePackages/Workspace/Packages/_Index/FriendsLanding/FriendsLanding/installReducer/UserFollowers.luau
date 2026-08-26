local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)

return dependenciesModule.Rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetUserFollowers.Succeeded.name] = function(_, p1)
		local t = {}
		
		for i, v in ipairs(p1.responseBody.data) do
			t[tostring(v.id)] = true
		end
		return t
	end
})