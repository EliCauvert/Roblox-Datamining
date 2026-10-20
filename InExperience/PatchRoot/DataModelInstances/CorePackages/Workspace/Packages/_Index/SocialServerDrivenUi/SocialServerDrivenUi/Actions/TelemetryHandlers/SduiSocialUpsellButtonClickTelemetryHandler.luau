local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local EventTypes = require(Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local SocialUpsellAnalytics = require(Parent.SocialUpsell).Analytics.SocialUpsellAnalytics
local list = { "upsellEntrySurface", "upsellComponent", "upsellPurpose" }

return function(p1, p2, p3)
	-- upvalues: list (copy), GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), SocialUpsellAnalytics (copy), EventTypes (copy)
	local List = {}
	local t = {}
	
	for _, value in list do
		local ActionTelemetryFieldValue = GetActionTelemetryFieldValueFunction(p1, p2, value)
		t[value] = ActionTelemetryFieldValue
		
		if ActionTelemetryFieldValue == nil then
			table.insert(List, value)
		end
	end
	if #List > 0 then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SocialUpsellButtonClickTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(List, ", ")}`
		}, p3.appPage)
	end
	SocialUpsellAnalytics.logUpsellEvent(EventTypes.SocialUpsellButtonClick, {
		upsellEntrySurface = t.upsellEntrySurface,
		upsellComponent = t.upsellComponent,
		upsellPurpose = t.upsellPurpose,
		upsellStage = GetActionTelemetryFieldValueFunction(p1, p2, "upsellStage"),
		upsellImpressionId = GetActionTelemetryFieldValueFunction(p1, p2, "upsellImpressionId"),
		btn = GetActionTelemetryFieldValueFunction(p1, p2, "btn"),
		conversationId = GetActionTelemetryFieldValueFunction(p1, p2, "conversationId"),
		upsellEntryComponent = GetActionTelemetryFieldValueFunction(p1, p2, "upsellEntryComponent")
	})
end