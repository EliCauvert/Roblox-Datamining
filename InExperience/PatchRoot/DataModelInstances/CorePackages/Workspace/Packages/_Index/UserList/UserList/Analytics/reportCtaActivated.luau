local userList = script:FindFirstAncestor("UserList")
local _ = require(userList.Common.Types)
local telemetryEmitterModule = require(userList.Analytics.telemetryEmitter)
local userListInteractionEventModule = require(userList.Analytics.userListInteractionEvent)

return function(p1, p2, p3, p4)
	-- upvalues: telemetryEmitterModule (ref), userListInteractionEventModule (ref)
	if p1 == nil then
		return
	end
	pcall(telemetryEmitterModule.emit, userListInteractionEventModule, {
		eventName = "CtaActivated",
		eventContext = p1.surface,
		subpage = p1.subpage,
		buttonType = p2,
		targetUserId = p3,
		absolutePosition = p4
	})
end