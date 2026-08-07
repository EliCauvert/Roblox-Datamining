local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local virtualEventsModule = require(parent.VirtualEvents)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue

return function(p0, p1, p2) --[[ line: 16 ]]
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), virtualEventsModule (ref)
	local var2 = getActionTelemetryFieldValue(p0, p1, "eventId")
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "ShareEventIconClicked",
			message = "Missing eventId for ShareEventIconClicked telemetry"
		}, p2.appPage)
		
		return
	end
	virtualEventsModule.fireShareVirtualEventIconClicked({
		virtualEventId = tostring(var2),
		universeId = tostring(getActionTelemetryFieldValue(p0, p1, "universeId", "")),
		channel = tostring(getActionTelemetryFieldValue(p0, p1, "channel", "eventDetailsPage"))
	})
end