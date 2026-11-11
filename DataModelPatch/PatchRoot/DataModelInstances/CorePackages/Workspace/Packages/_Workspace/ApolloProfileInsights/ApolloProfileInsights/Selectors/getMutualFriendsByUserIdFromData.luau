local GetProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)
local _ = require(script:FindFirstAncestor("ApolloProfileInsights").Parent.GraphQLServer)

return function(p1, p2)
	-- upvalues: GetProfileInsightsByUserIdFromDataModule (copy)
	local ProfileInsightsByUserIdFromDataModule = GetProfileInsightsByUserIdFromDataModule(p1, p2)
	local MutualFriends = nil
	
	if ProfileInsightsByUserIdFromDataModule then
		MutualFriends = ProfileInsightsByUserIdFromDataModule.mutualFriends
		
		if not MutualFriends then
			return {}
		end
	else
		MutualFriends = {}
	end
	return MutualFriends
end