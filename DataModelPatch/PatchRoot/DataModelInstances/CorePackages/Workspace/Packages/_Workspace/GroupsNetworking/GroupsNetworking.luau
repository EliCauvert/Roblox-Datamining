local NetworkRequests = script.networkRequests
local CreateJoinGroupModule = require(NetworkRequests.createJoinGroup)
local CreateCancelJoinGroupRequestModule = require(NetworkRequests.createCancelJoinGroupRequest)
local CreateLeaveGroupModule = require(NetworkRequests.createLeaveGroup)
local CreateMakePrimaryGroupModule = require(NetworkRequests.createMakePrimaryGroup)
local CreateRemovePrimaryGroupModule = require(NetworkRequests.createRemovePrimaryGroup)

return {
	config = function(p1)
		-- upvalues: CreateJoinGroupModule (copy), CreateCancelJoinGroupRequestModule (copy), CreateLeaveGroupModule (copy), CreateMakePrimaryGroupModule (copy), CreateRemovePrimaryGroupModule (copy)
		return {
			JoinGroup = CreateJoinGroupModule(p1),
			CancelJoinGroupRequest = CreateCancelJoinGroupRequestModule(p1),
			LeaveGroup = CreateLeaveGroupModule(p1),
			MakePrimaryGroup = CreateMakePrimaryGroupModule(p1),
			RemovePrimaryGroup = CreateRemovePrimaryGroupModule(p1)
		}
	end,
	["jest.config"] = script["jest.config"]
}