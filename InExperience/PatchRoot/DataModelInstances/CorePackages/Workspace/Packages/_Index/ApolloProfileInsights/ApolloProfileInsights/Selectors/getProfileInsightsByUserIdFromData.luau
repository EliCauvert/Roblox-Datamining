local Parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.GraphQLServer)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: CryoModule (copy)
	if p1 and p1.profilesInsightsByUserIds then
		local ProfilesInsightsByUserIds = p1.profilesInsightsByUserIds
		
		return ProfilesInsightsByUserIds[CryoModule.List.findWhere(ProfilesInsightsByUserIds, function(p3, _): boolean --[[ Line: 20 ]]
			-- upvalues: p2 (copy)
			return p3.targetUserId == tostring(p2)
		end)]
	else
		return nil
	end
end