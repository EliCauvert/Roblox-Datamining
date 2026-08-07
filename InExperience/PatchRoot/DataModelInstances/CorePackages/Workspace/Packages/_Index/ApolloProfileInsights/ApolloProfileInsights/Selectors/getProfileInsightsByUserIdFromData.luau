local parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.GraphQLServer)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: cryoModule (ref)
	if p0 and p0.profilesInsightsByUserIds then
		local profilesInsightsByUserIds = p0.profilesInsightsByUserIds
		
		return profilesInsightsByUserIds[cryoModule.List.findWhere(profilesInsightsByUserIds, function(p2, _) --[[ line: 20 ]]
			-- upvalues: p1 (ref)
			return p2.targetUserId == tostring(p1)
		end)]
	end
	return nil
end