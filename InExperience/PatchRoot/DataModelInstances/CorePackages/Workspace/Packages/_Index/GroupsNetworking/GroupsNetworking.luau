local networkRequests = script.networkRequests
local createJoinGroupModule = require(networkRequests.createJoinGroup)
local createCancelJoinGroupRequestModule = require(networkRequests.createCancelJoinGroupRequest)
local createLeaveGroupModule = require(networkRequests.createLeaveGroup)
local createMakePrimaryGroupModule = require(networkRequests.createMakePrimaryGroup)
local createRemovePrimaryGroupModule = require(networkRequests.createRemovePrimaryGroup)

return {
	config = function(p0) --[[ line: 12 ]]
		-- upvalues: createJoinGroupModule (ref), createCancelJoinGroupRequestModule (ref), createLeaveGroupModule (ref), createMakePrimaryGroupModule (ref), createRemovePrimaryGroupModule (ref)
		return {
			JoinGroup = createJoinGroupModule(p0),
			CancelJoinGroupRequest = createCancelJoinGroupRequestModule(p0),
			LeaveGroup = createLeaveGroupModule(p0),
			MakePrimaryGroup = createMakePrimaryGroupModule(p0),
			RemovePrimaryGroup = createRemovePrimaryGroupModule(p0)
		}
	end,
	["jest.config"] = script["jest.config"]
}