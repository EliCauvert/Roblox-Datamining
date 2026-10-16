local _ = require(script:FindFirstAncestor("UserProfiles").Parent.ApolloClient)

return function(p1) --[[ Line: 7 ]]
	local UserId = p1.userId
	local Names = p1.names
	p1.client:writeQuery({
		variables = { userIds = { UserId } },
		query = p1.query,
		data = {
			userProfiles = {
				{
					__typename = "UserProfile",
					id = UserId,
					names = {
						__typename = "Names",
						combinedName = if Names.alias == "" then if Names.contactName == "" then if Names.displayName == "" then Names.username else Names.displayName else Names.contactName else Names.alias,
						alias = Names.alias,
						contactName = Names.contactName,
						displayName = Names.displayName,
						username = Names.username
					}
				}
			}
		}
	})
end