local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama

return dependenciesModule.Rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(_, p0) --[[ line: 11 ]]
		-- upvalues: llama (ref)
		return llama.Dictionary.map(p0.responseBody.data, function(p1) --[[ line: 13 ]]
			return p1.isDeleted, tostring(p1.id)
		end)
	end
})