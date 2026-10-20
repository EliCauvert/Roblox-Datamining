local NetworkRequests = script.Parent.networkRequests
local CreateGetBlockedUsersModule = require(NetworkRequests.createGetBlockedUsers)
local CreateBlockUserByIdModule = require(NetworkRequests.createBlockUserById)
local CreateUnblockUserByIdModule = require(NetworkRequests.createUnblockUserById)

return function(p1)
	-- upvalues: CreateGetBlockedUsersModule (copy), CreateBlockUserByIdModule (copy), CreateUnblockUserByIdModule (copy)
	return {
		GetBlockedUsers = CreateGetBlockedUsersModule(p1),
		BlockUserById = CreateBlockUserByIdModule(p1),
		UnblockUserById = CreateUnblockUserByIdModule(p1)
	}
end