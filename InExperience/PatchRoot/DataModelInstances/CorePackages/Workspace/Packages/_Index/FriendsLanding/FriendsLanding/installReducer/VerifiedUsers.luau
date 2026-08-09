local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local rodux = dependenciesModule.Rodux
local llama = dependenciesModule.llama

local var1 = function(p0, p1) --[[ line: 17 ]]
	-- upvalues: llama (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tostring(v.id)] = if v.hasVerifiedBadge then true else llama.None
	end
	return llama.Dictionary.join(p0, t)
end

return rodux.createReducer({}, {
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3) --[[ line: 28 ]]
		-- upvalues: var1 (ref)
		return var1(p2, p3.responseBody.data)
	end
})