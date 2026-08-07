local networkRequests = script.Parent.networkRequests
local createGetBlockedUsersModule = require(networkRequests.createGetBlockedUsers)
local createBlockUserByIdModule = require(networkRequests.createBlockUserById)
local createUnblockUserByIdModule = require(networkRequests.createUnblockUserById)
local createIsBlockedByIdModule = require(networkRequests.createIsBlockedById)

return function(p0) --[[ line: 8 ]]
	-- upvalues: createGetBlockedUsersModule (ref), createBlockUserByIdModule (ref), createUnblockUserByIdModule (ref), createIsBlockedByIdModule (ref)
	return {
		GetBlockedUsers = createGetBlockedUsersModule(p0),
		BlockUserById = createBlockUserByIdModule(p0),
		UnblockUserById = createUnblockUserByIdModule(p0),
		IsBlockedById = createIsBlockedByIdModule(p0)
	}
end