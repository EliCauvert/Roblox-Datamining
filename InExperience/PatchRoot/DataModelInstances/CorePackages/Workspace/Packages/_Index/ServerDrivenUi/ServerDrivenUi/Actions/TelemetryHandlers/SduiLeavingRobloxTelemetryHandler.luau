local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SendOpenLeavingRobloxModalEventFunction = require(Parent.DiscoveryAnalytics).Events.sendOpenLeavingRobloxModalEvent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local list = {
	"assignmentId",
	"assignmentType",
	"socialLinkType",
	"socialLinkDisplayType"
}

return function(p1, p2, p3) --[[ Line: 17 ]]
	-- upvalues: list (copy), GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), SendOpenLeavingRobloxModalEventFunction (copy)
	local List = {}
	
	for _, value in list do
		if GetActionTelemetryFieldValueFunction(p1, p2, value) == nil then
			table.insert(List, value)
		end
	end
	if #List > 0 then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "LeavingRobloxTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(List, ", ")}`
		}, p3.appPage)
	end
	SendOpenLeavingRobloxModalEventFunction({
		assignment_id = tonumber(GetActionTelemetryFieldValueFunction(p1, p2, "assignmentId", 0)) or 0,
		assignment_type = GetActionTelemetryFieldValueFunction(p1, p2, "assignmentType", ""),
		social_link_type = GetActionTelemetryFieldValueFunction(p1, p2, "socialLinkType", ""),
		social_link_display_type = GetActionTelemetryFieldValueFunction(p1, p2, "socialLinkDisplayType", "")
	})
end