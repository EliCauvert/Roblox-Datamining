local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sendOpenLeavingRobloxModalEvent = require(parent.DiscoveryAnalytics).Events.sendOpenLeavingRobloxModalEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local list = {
	"assignmentId",
	"assignmentType",
	"socialLinkType",
	"socialLinkDisplayType"
}

return function(p1, p2, p3)
	-- upvalues: list (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), sendOpenLeavingRobloxModalEvent (ref)
	local t = {}
	
	for i, v in list do
		if getActionTelemetryFieldValue(p1, p2, v) == nil then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "LeavingRobloxTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(t, ", ")}`
		}, p3.appPage)
	end
	sendOpenLeavingRobloxModalEvent({
		assignment_id = tonumber(getActionTelemetryFieldValue(p1, p2, "assignmentId", 0)) or 0,
		assignment_type = getActionTelemetryFieldValue(p1, p2, "assignmentType", ""),
		social_link_type = getActionTelemetryFieldValue(p1, p2, "socialLinkType", ""),
		social_link_display_type = getActionTelemetryFieldValue(p1, p2, "socialLinkDisplayType", "")
	})
end