local UserList = script:FindFirstAncestor("UserList")
local _ = require(UserList.Common.Types)
local TelemetryEmitterModule = require(UserList.Analytics.telemetryEmitter)
local UserListInteractionEventModule = require(UserList.Analytics.userListInteractionEvent)
local ButtonTypes = require(UserList.Common.Enums).ButtonTypes

return function(p1) --[[ Line: 24 | Named "reportViewCta" ]]
	-- upvalues: ButtonTypes (copy), TelemetryEmitterModule (copy), UserListInteractionEventModule (copy)
	if p1 ~= nil then
		pcall(TelemetryEmitterModule.emit, UserListInteractionEventModule, {
			eventName = "ViewCta",
			eventContext = p1.surface,
			subpage = p1.subpage,
			buttonType = ButtonTypes.View
		})
		
		return
	end
end