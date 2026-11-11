local Parent = script.Parent
local NetworkRequests = Parent.networkRequests
local CreateUploadContactsByUserModule = require(NetworkRequests.createUploadContactsByUser)
local CreateFindContactFriendsModule = require(NetworkRequests.createFindContactFriends)
local CreateGetContactEntitiesByContactIdModule = require(NetworkRequests.createGetContactEntitiesByContactId)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: CreateUploadContactsByUserModule (copy), CreateFindContactFriendsModule (copy), CreateGetContactEntitiesByContactIdModule (copy)
	return {
		UploadContactsByUser = CreateUploadContactsByUserModule(p1),
		FindContactFriends = CreateFindContactFriendsModule(p1),
		GetContactEntitiesByContactId = CreateGetContactEntitiesByContactIdModule(p1)
	}
end