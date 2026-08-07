local parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.ApolloClient)
local queries = require(parent.ApolloLocalState).queries

return function(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: queries (ref), cryoModule (ref)
	local var1 = if p2 and p2.query then p2.query else queries.profilesInsightsByUserIds
	
	for i, v in p1 do
		local t = {}
		
		for i_1, v_1 in v.mutualFriends or {} do
			table.insert(t, cryoModule.Dictionary.join({
				__typename = "MutualFriend",
				id = v_1.id or tostring(i_1),
				username = v_1.username or "",
				displayName = v_1.displayName or ""
			}, v_1))
		end
		p0:writeQuery({
			variables = { userIds = i },
			query = var1,
			data = {
				profilesInsightsByUserIds = {
					{
						__typename = "ProfileInsights",
						targetUserId = v.targetUserId or tostring(i),
						isOfflineFrequents = v.isOfflineFrequents or false,
						mutualFriends = t,
						friendshipAgeUnixSeconds = v.friendshipAgeUnixSeconds or 0,
						friendRequestOriginSource = v.friendRequestOriginSource or 0,
						accountCreationDateUnixSeconds = v.accountCreationDateUnixSeconds or 0,
						localizedCountryName = v.localizedCountryName or "",
						userAgeVerifiedBracket = v.userAgeVerifiedBracket or ""
					}
				}
			}
		})
	end
end