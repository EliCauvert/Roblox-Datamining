local DependenciesModule = require(script:FindFirstAncestor("SocialTabState").dependencies)
local Llama = DependenciesModule.llama

return DependenciesModule.Rodux.createReducer({}, {
	SetUserMembershipType = function(p1, p2)
		-- upvalues: Llama (copy)
		return Llama.Dictionary.set(p1, p2.userId, p2.membershipType ~= Enum.MembershipType.None)
	end
})