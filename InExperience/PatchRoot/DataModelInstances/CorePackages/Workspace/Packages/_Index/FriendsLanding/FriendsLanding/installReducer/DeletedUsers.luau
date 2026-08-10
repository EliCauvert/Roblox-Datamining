local friendsLanding = script:FindFirstAncestor("FriendsLanding")

if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then
	return nil
end
local dependenciesModule = require(friendsLanding.dependencies)
local llama = dependenciesModule.llama

return dependenciesModule.Rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(_, p0) --[[ line: 18 ]]
		-- upvalues: llama (ref)
		return llama.Dictionary.map(p0.responseBody.data, function(p1) --[[ line: 20 ]]
			return p1.isDeleted, tostring(p1.id)
		end)
	end
})