local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Default = require(PurchasePrompt.Parent.LoggingProtocol).default
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)

function sendUnifiedPurchaseEventLog(p1) --[[ Line: 7 ]]
	-- upvalues: Default (copy), UnifiedPurchaseTelemetryModule (copy)
	Default:logRobloxTelemetryEvent(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseFlowEvent, {
		Default.StandardizedFields.addOsInfo,
		Default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1)
end

return sendUnifiedPurchaseEventLog