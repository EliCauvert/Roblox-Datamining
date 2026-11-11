local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SendSocialLinkClickEventFunction = require(Parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local list = {
	"profileId",
	"profileType",
	"socialLinkType",
	"socialLinkUrl",
	"socialLinkDisplayType"
}

return function(p1, p2, p3)
	-- upvalues: list (copy), GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), SendSocialLinkClickEventFunction (copy)
	local List = {}
	
	for _, value in list do
		if GetActionTelemetryFieldValueFunction(p1, p2, value) == nil then
			table.insert(List, value)
		end
	end
	if #List > 0 then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SocialLinkClickTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(List, ", ")}`
		}, p3.appPage)
	end
	SendSocialLinkClickEventFunction({
		assignment_id = tonumber(GetActionTelemetryFieldValueFunction(p1, p2, "profileId", 0)) or 0,
		assignment_type = GetActionTelemetryFieldValueFunction(p1, p2, "profileType", ""),
		social_link_type = GetActionTelemetryFieldValueFunction(p1, p2, "socialLinkType", ""),
		social_link_url = GetActionTelemetryFieldValueFunction(p1, p2, "socialLinkUrl", ""),
		social_link_display_type = GetActionTelemetryFieldValueFunction(p1, p2, "socialLinkDisplayType", "")
	})
end