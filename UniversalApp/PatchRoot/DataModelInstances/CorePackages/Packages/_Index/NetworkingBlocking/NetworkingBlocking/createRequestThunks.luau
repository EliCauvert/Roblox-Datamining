local networkRequests = script.Parent.networkRequests
local createGetBlockedUsersModule = require(networkRequests.createGetBlockedUsers)
local createBlockUserByIdModule = require(networkRequests.createBlockUserById)
local createUnblockUserByIdModule = require(networkRequests.createUnblockUserById)

return function(p1)
	-- upvalues: createGetBlockedUsersModule (ref), createBlockUserByIdModule (ref), createUnblockUserByIdModule (ref)
	return {
		GetBlockedUsers = createGetBlockedUsersModule(p1),
		BlockUserById = createBlockUserByIdModule(p1),
		UnblockUserById = createUnblockUserByIdModule(p1)
	}
end