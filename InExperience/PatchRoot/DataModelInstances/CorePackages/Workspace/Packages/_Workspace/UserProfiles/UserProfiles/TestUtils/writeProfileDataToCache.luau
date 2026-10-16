local UserProfiles = script:FindFirstAncestor("UserProfiles")
local Parent = UserProfiles.Parent
local QueriesModule = require(UserProfiles.Common.Queries)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.ApolloClient)

return function(p1, List, p2) --[[ Line: 15 ]]
	-- upvalues: QueriesModule (copy), CryoModule (copy)
	local Query = if p2 and p2.query then p2.query else QueriesModule.userProfilesAllNamesByUserIds
	for Id, value in List do
		p1:writeQuery({
			variables = { userIds = Id },
			query = Query,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						platformProfileId = "",
						id = Id,
						names = CryoModule.Dictionary.join({
							__typename = "Names",
							alias = "",
							contactName = "",
							displayName = "",
							username = "",
							platformName = ""
						}, value)
					}
				}
			}
		})
	end
end