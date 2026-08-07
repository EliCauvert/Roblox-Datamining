local networkRequests = script.Parent.networkRequests
local createGetBlockedUsersModule = require(networkRequests.createGetBlockedUsers)
local createBlockUserByIdModule = require(networkRequests.createBlockUserById)
local createUnblockUserByIdModule = require(networkRequests.createUnblockUserById)

return function(p0) --[[ line: 7 ]]
	-- upvalues: createGetBlockedUsersModule (ref), createBlockUserByIdModule (ref), createUnblockUserByIdModule (ref)
	return {
		GetBlockedUsers = createGetBlockedUsersModule(p0),
		BlockUserById = createBlockUserByIdModule(p0),
		UnblockUserById = createUnblockUserByIdModule(p0)
	}
end