local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sendSocialLinkClickEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local list = {
	"profileId",
	"profileType",
	"socialLinkType",
	"socialLinkUrl",
	"socialLinkDisplayType"
}

return function(p1, p2, p3)
	-- upvalues: list (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), sendSocialLinkClickEvent (ref)
	local t = {}
	
	for i, v in list do
		if getActionTelemetryFieldValue(p1, p2, v) == nil then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SocialLinkClickTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(t, ", ")}`
		}, p3.appPage)
	end
	sendSocialLinkClickEvent({
		assignment_id = tonumber(getActionTelemetryFieldValue(p1, p2, "profileId", 0)) or 0,
		assignment_type = getActionTelemetryFieldValue(p1, p2, "profileType", ""),
		social_link_type = getActionTelemetryFieldValue(p1, p2, "socialLinkType", ""),
		social_link_url = getActionTelemetryFieldValue(p1, p2, "socialLinkUrl", ""),
		social_link_display_type = getActionTelemetryFieldValue(p1, p2, "socialLinkDisplayType", "")
	})
end