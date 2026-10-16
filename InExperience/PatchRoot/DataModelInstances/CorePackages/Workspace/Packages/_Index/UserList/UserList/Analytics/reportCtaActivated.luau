local UserList = script:FindFirstAncestor("UserList")
local _ = require(UserList.Common.Types)
local TelemetryEmitterModule = require(UserList.Analytics.telemetryEmitter)
local UserListInteractionEventModule = require(UserList.Analytics.userListInteractionEvent)

return function(p1, ButtonType, TargetUserId, AbsolutePosition) --[[ Line: 18 | Named "reportCtaActivated" ]]
	-- upvalues: TelemetryEmitterModule (copy), UserListInteractionEventModule (copy)
	if p1 ~= nil then
		pcall(TelemetryEmitterModule.emit, UserListInteractionEventModule, {
			eventName = "CtaActivated",
			eventContext = p1.surface,
			subpage = p1.subpage,
			buttonType = ButtonType,
			targetUserId = TargetUserId,
			absolutePosition = AbsolutePosition
		})
		
		return
	end
end