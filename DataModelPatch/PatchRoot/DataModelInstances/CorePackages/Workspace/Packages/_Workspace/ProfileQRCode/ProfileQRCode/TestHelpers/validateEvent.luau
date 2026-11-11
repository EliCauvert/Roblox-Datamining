local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local EventStreamActionListModule = require(ProfileQRCode.Analytics.EventStreamActionList)
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local DashModule = require(ProfileQRCode.Parent.Dash)

return function(p1, p2)
	-- upvalues: EventNamesModule (copy), EventStreamActionListModule (copy), DashModule (copy)
	assert(EventNamesModule.isEnumValue(p1), "Invalid event name")
	local EventStreamActionListModuleEntry = EventStreamActionListModule[p1]
	
	return EventStreamActionListModuleEntry.context, EventStreamActionListModuleEntry.eventType, DashModule.join(EventStreamActionListModuleEntry.additionalInfo, {
		btn = if EventStreamActionListModuleEntry.additionalInfo and EventStreamActionListModuleEntry.additionalInfo.btn then EventStreamActionListModuleEntry.additionalInfo.btn.rawValue() else nil
	}, p2)
end