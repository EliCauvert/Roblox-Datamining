local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local socialUpsellModule = require(parent.SocialUpsell)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local socialUpsellAnalytics = socialUpsellModule.Analytics.SocialUpsellAnalytics
local list = { "upsellEntrySurface", "upsellComponent", "upsellPurpose" }

return function(p1, p2, p3)
	-- upvalues: list (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), socialUpsellAnalytics (ref), eventTypes (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in list do
		local var1 = getActionTelemetryFieldValue(p1, p2, v)
		t_1[v] = var1
		
		if var1 == nil then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SocialUpsellButtonClickTelemetryHandler",
			message = `Missing telemetry fields: {table.concat(t, ", ")}`
		}, p3.appPage)
	end
	socialUpsellAnalytics.logUpsellEvent(eventTypes.SocialUpsellButtonClick, {
		upsellEntrySurface = t_1.upsellEntrySurface,
		upsellComponent = t_1.upsellComponent,
		upsellPurpose = t_1.upsellPurpose,
		upsellStage = getActionTelemetryFieldValue(p1, p2, "upsellStage"),
		upsellImpressionId = getActionTelemetryFieldValue(p1, p2, "upsellImpressionId"),
		btn = getActionTelemetryFieldValue(p1, p2, "btn"),
		conversationId = getActionTelemetryFieldValue(p1, p2, "conversationId"),
		upsellEntryComponent = getActionTelemetryFieldValue(p1, p2, "upsellEntryComponent")
	})
end