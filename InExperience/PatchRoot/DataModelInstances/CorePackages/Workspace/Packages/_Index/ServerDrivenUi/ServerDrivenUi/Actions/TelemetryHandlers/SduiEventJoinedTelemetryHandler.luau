local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local virtualEventsModule = require(parent.VirtualEvents)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), virtualEventsModule (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "eventId")
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "EventJoined",
			message = "Missing eventId for EventJoined telemetry"
		}, p3.appPage)
		
		return
	end
	virtualEventsModule.fireVirtualEventJoined({
		virtualEventId = var1,
		universeId = tostring(getActionTelemetryFieldValue(p1, p2, "universeId", "")),
		channel = tostring(getActionTelemetryFieldValue(p1, p2, "channel", ""))
	})
end