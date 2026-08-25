local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local queriesModule = require(userProfiles.Common.Queries)
local cryoModule = require(parent.Cryo)
local _ = require(parent.ApolloClient)

return function(p0, p1, p2)
	-- upvalues: queriesModule (ref), cryoModule (ref)
	local var3 = if p2 and p2.query then p2.query else queriesModule.userProfilesAllNamesByUserIds
	
	for i, v in p1 do
		p0:writeQuery({
			variables = { userIds = i },
			query = var3,
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