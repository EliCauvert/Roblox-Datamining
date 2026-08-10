local parent = script.Parent
local networkRequests = parent.networkRequests
local createUploadContactsByUserModule = require(networkRequests.createUploadContactsByUser)
local createFindContactFriendsModule = require(networkRequests.createFindContactFriends)
local createGetContactEntitiesByContactIdModule = require(networkRequests.createGetContactEntitiesByContactId)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: createUploadContactsByUserModule (ref), createFindContactFriendsModule (ref), createGetContactEntitiesByContactIdModule (ref)
	return {
		UploadContactsByUser = createUploadContactsByUserModule(p0),
		FindContactFriends = createFindContactFriendsModule(p0),
		GetContactEntitiesByContactId = createGetContactEntitiesByContactIdModule(p0)
	}
end