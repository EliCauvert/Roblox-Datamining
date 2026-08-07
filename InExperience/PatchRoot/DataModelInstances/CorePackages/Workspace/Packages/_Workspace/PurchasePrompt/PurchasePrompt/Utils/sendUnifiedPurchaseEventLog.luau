local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local default = require(purchasePrompt.Parent.LoggingProtocol).default
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)

function sendUnifiedPurchaseEventLog(p0) --[[ line: 7 ]]
	-- upvalues: default (ref), unifiedPurchaseTelemetryModule (ref)
	default:logRobloxTelemetryEvent(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseFlowEvent, {
		default.StandardizedFields.addOsInfo,
		default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p0)
end

return sendUnifiedPurchaseEventLog