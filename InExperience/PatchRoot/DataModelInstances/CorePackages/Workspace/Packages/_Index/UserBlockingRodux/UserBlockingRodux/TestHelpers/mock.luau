local roduxModule = require(script:FindFirstAncestor("UserBlockingRodux").Parent.Rodux)

return {
	mockBlockUserById = "BLOCK_USER_BY_ID_SUCCEEDED_ACTION",
	mockUnblockUserById = "UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION",
	mockIsBlockedById = "IS_BLOCKED_BY_ID_SUCCEEDED_ACTION",
	mockBlockUserByIdAction = roduxModule.makeActionCreator("BLOCK_USER_BY_ID_SUCCEEDED_ACTION", function(p0)
		return { responseBody = {}, namedIds = { users = p0.userId } }
	end),
	mockUnblockUserByIdAction = roduxModule.makeActionCreator("UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION", function(p1)
		return { responseBody = {}, namedIds = { users = p1.userId } }
	end),
	mockIsBlockedByIdAction = roduxModule.makeActionCreator("IS_BLOCKED_BY_ID_SUCCEEDED_ACTION", function(p2)
		return { responseBody = true, namedIds = { users = p2.userId } }
	end)
}