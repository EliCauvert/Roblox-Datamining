local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama

local function v2(p1, List)
	-- upvalues: Llama (copy)
	local Nones = {}
	
	for _, value in ipairs(List) do
		Nones[tostring(value.id)] = if value.hasVerifiedBadge then true else Llama.None
	end
	return Llama.Dictionary.join(p1, Nones)
end

return DependenciesModule.Rodux.createReducer({}, {
	[DependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3)
		-- upvalues: v2 (copy)
		return v2(p2, p3.responseBody.data)
	end
})