local userList = script:FindFirstAncestor("UserList")
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local telemetryEmitterModule = require(userList.Analytics.telemetryEmitter)
local userListInteractionEventModule = require(userList.Analytics.userListInteractionEvent)
local buttonTypes = enumsModule.ButtonTypes

return function(p1)
	-- upvalues: buttonTypes (ref), telemetryEmitterModule (ref), userListInteractionEventModule (ref)
	if p1 == nil then
		return
	end
	pcall(telemetryEmitterModule.emit, userListInteractionEventModule, {
		eventName = "ViewCta",
		eventContext = p1.surface,
		subpage = p1.subpage,
		buttonType = buttonTypes.View
	})
end