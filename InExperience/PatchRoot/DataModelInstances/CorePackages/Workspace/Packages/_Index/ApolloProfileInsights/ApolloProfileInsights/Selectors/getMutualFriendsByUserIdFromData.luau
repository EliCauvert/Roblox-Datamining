local getProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)
local _ = require(script:FindFirstAncestor("ApolloProfileInsights").Parent.GraphQLServer)

return function(p1, p2)
	-- upvalues: getProfileInsightsByUserIdFromDataModule (ref)
	local mutualFriends
	local var1 = getProfileInsightsByUserIdFromDataModule(p1, p2)
	
	if var1 then
		mutualFriends = var1.mutualFriends
		
		return mutualFriends or {}
	end
	mutualFriends = {}
end