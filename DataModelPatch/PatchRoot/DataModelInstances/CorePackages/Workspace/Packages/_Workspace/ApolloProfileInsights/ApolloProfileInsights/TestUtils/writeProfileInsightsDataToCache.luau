local Parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.ApolloClient)
local Queries = require(Parent.ApolloLocalState).queries

return function(p1, List, p2)
	-- upvalues: Queries (copy), CryoModule (copy)
	local Query = if p2 and p2.query then p2.query else Queries.profilesInsightsByUserIds
	for UserIds, value in List do
		local MutualFriends = {}
		
		for i, value1 in value.mutualFriends or {} do
			table.insert(MutualFriends, CryoModule.Dictionary.join({
				__typename = "MutualFriend",
				id = value1.id or tostring(i),
				username = value1.username or "",
				displayName = value1.displayName or ""
			}, value1))
		end
		p1:writeQuery({
			variables = { userIds = UserIds },
			query = Query,
			data = {
				profilesInsightsByUserIds = {
					{
						__typename = "ProfileInsights",
						targetUserId = value.targetUserId or tostring(UserIds),
						isOfflineFrequents = value.isOfflineFrequents or false,
						mutualFriends = MutualFriends,
						friendshipAgeUnixSeconds = value.friendshipAgeUnixSeconds or 0,
						friendRequestOriginSource = value.friendRequestOriginSource or 0,
						accountCreationDateUnixSeconds = value.accountCreationDateUnixSeconds or 0,
						localizedCountryName = value.localizedCountryName or "",
						userAgeVerifiedBracket = value.userAgeVerifiedBracket or ""
					}
				}
			}
		})
	end
end