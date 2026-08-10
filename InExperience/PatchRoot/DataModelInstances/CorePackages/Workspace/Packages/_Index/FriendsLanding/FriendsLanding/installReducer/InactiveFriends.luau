local friendsLanding = script:FindFirstAncestor("FriendsLanding")

if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then
	return nil
end
local dependenciesModule = require(friendsLanding.dependencies)

return dependenciesModule.Rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetInactiveFriends.Succeeded.name] = function(_, p0) --[[ line: 17 ]]
		local t = {}
		
		for i, v in pairs(p0.responseBody.data) do
			t[tostring(v.id)] = true
		end
		return t
	end
})