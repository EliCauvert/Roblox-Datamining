local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local queriesModule = require(userProfiles.Common.Queries)
local cryoModule = require(parent.Cryo)
local _ = require(parent.ApolloClient)

return function(p1, p2, p3)
	-- upvalues: queriesModule (ref), cryoModule (ref)
	local var1 = if p3 and p3.query then p3.query else queriesModule.userProfilesAllNamesByUserIds
	
	for i, v in p2 do
		p1:writeQuery({
			variables = { userIds = i },
			query = var1,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = i,
						names = cryoModule.Dictionary.join({
							__typename = "Names",
							alias = "",
							contactName = "",
							displayName = "",
							username = "",
							platformName = ""
						}, v)
					}
				}
			}
		})
	end
end