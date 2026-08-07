local _ = require(script:FindFirstAncestor("UserProfiles").Parent.ApolloClient)

return function(p0) --[[ line: 7 ]]
	local client = p0.client
	local query = p0.query
	local userId = p0.userId
	local names = p0.names
	client:writeQuery({
		variables = { userIds = { userId } },
		query = query,
		data = {
			userProfiles = {
				{
					__typename = "UserProfile",
					id = userId,
					names = {
						__typename = "Names",
						combinedName = if names.alias ~= "" then if names.contactName ~= "" then if names.displayName ~= "" then names.username else names.displayName else names.contactName else names.alias,
						alias = names.alias,
						contactName = names.contactName,
						displayName = names.displayName,
						username = names.username
					}
				}
			}
		}
	})
end