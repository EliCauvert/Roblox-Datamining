local friendsLanding = script:FindFirstAncestor("FriendsLanding")

if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then
	return nil
end
local dependenciesModule = require(friendsLanding.dependencies)
local rodux = dependenciesModule.Rodux
local llama = dependenciesModule.llama

local var2 = function(p0, p1) --[[ line: 24 ]]
	-- upvalues: llama (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tostring(v.id)] = if v.hasVerifiedBadge then true else llama.None
	end
	return llama.Dictionary.join(p0, t)
end

return rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3) --[[ line: 35 ]]
		-- upvalues: var2 (ref)
		return var2(p2, p3.responseBody.data)
	end
})