local networkRequests = script.networkRequests
local createJoinGroupModule = require(networkRequests.createJoinGroup)
local createCancelJoinGroupRequestModule = require(networkRequests.createCancelJoinGroupRequest)
local createLeaveGroupModule = require(networkRequests.createLeaveGroup)
local createMakePrimaryGroupModule = require(networkRequests.createMakePrimaryGroup)
local createRemovePrimaryGroupModule = require(networkRequests.createRemovePrimaryGroup)

return {
	config = function(p1)
		-- upvalues: createJoinGroupModule (ref), createCancelJoinGroupRequestModule (ref), createLeaveGroupModule (ref), createMakePrimaryGroupModule (ref), createRemovePrimaryGroupModule (ref)
		return {
			JoinGroup = createJoinGroupModule(p1),
			CancelJoinGroupRequest = createCancelJoinGroupRequestModule(p1),
			LeaveGroup = createLeaveGroupModule(p1),
			MakePrimaryGroup = createMakePrimaryGroupModule(p1),
			RemovePrimaryGroup = createRemovePrimaryGroupModule(p1)
		}
	end,
	["jest.config"] = script["jest.config"]
}