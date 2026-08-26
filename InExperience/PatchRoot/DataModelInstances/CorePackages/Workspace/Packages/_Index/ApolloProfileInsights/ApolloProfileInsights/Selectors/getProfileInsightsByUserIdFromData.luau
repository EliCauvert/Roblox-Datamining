local parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.GraphQLServer)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	if p1 and p1.profilesInsightsByUserIds then
		local profilesInsightsByUserIds = p1.profilesInsightsByUserIds
		
		return profilesInsightsByUserIds[cryoModule.List.findWhere(profilesInsightsByUserIds, function(p3, _)
			-- upvalues: p2 (ref)
			return p3.targetUserId == tostring(p2)
		end)]
	end
	return nil
end