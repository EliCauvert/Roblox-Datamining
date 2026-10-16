local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local VirtualEventsModule = require(Parent.VirtualEvents)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue

return function(p1, p2, p3) --[[ Line: 16 ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), VirtualEventsModule (copy)
	local EventId = GetActionTelemetryFieldValueFunction(p1, p2, "eventId")
	
	if EventId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "ShareEventIconClicked",
			message = "Missing eventId for ShareEventIconClicked telemetry"
		}, p3.appPage)
		
		return
	else
		VirtualEventsModule.fireShareVirtualEventIconClicked({
			virtualEventId = tostring(EventId),
			universeId = tostring((GetActionTelemetryFieldValueFunction(p1, p2, "universeId", ""))),
			channel = tostring((GetActionTelemetryFieldValueFunction(p1, p2, "channel", "eventDetailsPage")))
		})
	end
end