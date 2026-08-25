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

return function(p0, p1, p2)
	-- upvalues: list (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), sendOpenLeavingRobloxModalEvent (ref)
	local t = {}
	
	for i, v in list do
		if getActionTelemetryFieldValue(p0, p1, v) == nil then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "LeavingRobloxTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(t, ", ")}`
		}, p2.appPage)
	end
	sendOpenLeavingRobloxModalEvent({
		assignment_id = tonumber(getActionTelemetryFieldValue(p0, p1, "assignmentId", 0)) or 0,
		assignment_type = getActionTelemetryFieldValue(p0, p1, "assignmentType", ""),
		social_link_type = getActionTelemetryFieldValue(p0, p1, "socialLinkType", ""),
		social_link_display_type = getActionTelemetryFieldValue(p0, p1, "socialLinkDisplayType", "")
	})
end