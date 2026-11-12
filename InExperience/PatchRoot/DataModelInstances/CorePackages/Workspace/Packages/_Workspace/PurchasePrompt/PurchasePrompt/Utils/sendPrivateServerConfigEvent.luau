local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Default = require(PurchasePrompt.Parent.LoggingProtocol).default
local VIPServerPostPurchaseTelemetryModule = require(PurchasePrompt.Events.VIPServerPostPurchaseTelemetry)
local _ = require(PurchasePrompt.types)

return function(p1)
	-- upvalues: Default (copy), VIPServerPostPurchaseTelemetryModule (copy)
	Default:logRobloxTelemetryEvent(VIPServerPostPurchaseTelemetryModule.PrivateServerConfigEvent, {
		Default.StandardizedFields.addOsInfo,
		Default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1)
end