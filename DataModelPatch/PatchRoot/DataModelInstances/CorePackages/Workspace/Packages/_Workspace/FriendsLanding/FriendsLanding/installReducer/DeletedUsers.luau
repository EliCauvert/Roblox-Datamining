local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama

return DependenciesModule.Rodux.createReducer({}, {
	[DependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(_, p1)
		-- upvalues: Llama (copy)
		return Llama.Dictionary.map(p1.responseBody.data, function(p2)
			return p2.isDeleted, (tostring(p2.id))
		end)
	end
})