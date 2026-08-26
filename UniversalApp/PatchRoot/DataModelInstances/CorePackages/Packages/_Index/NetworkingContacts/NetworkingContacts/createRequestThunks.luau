local parent = script.Parent
local networkRequests = parent.networkRequests
local createUploadContactsByUserModule = require(networkRequests.createUploadContactsByUser)
local createFindContactFriendsModule = require(networkRequests.createFindContactFriends)
local createGetContactEntitiesByContactIdModule = require(networkRequests.createGetContactEntitiesByContactId)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: createUploadContactsByUserModule (ref), createFindContactFriendsModule (ref), createGetContactEntitiesByContactIdModule (ref)
	return {
		UploadContactsByUser = createUploadContactsByUserModule(p1),
		FindContactFriends = createFindContactFriendsModule(p1),
		GetContactEntitiesByContactId = createGetContactEntitiesByContactIdModule(p1)
	}
end