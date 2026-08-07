local getProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)
local _ = require(script:FindFirstAncestor("ApolloProfileInsights").Parent.GraphQLServer)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: getProfileInsightsByUserIdFromDataModule (ref)
	local mutualFriends
	local var1 = getProfileInsightsByUserIdFromDataModule(p0, p1)
	
	if var1 then
		mutualFriends = var1.mutualFriends
		
		return mutualFriends or {}
	end
	mutualFriends = {}
end