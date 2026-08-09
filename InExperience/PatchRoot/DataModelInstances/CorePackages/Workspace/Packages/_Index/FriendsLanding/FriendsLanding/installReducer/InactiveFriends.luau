local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)

return dependenciesModule.Rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetInactiveFriends.Succeeded.name] = function(_, p0) --[[ line: 10 ]]
		local t = {}
		
		for i, v in pairs(p0.responseBody.data) do
			t[tostring(v.id)] = true
		end
		return t
	end
})