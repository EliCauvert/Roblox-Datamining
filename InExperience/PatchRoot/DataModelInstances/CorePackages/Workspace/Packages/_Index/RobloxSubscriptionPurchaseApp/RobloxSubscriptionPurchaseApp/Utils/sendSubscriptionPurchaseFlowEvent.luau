local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Default = require(RobloxSubscriptionPurchaseApp.Parent.LoggingProtocol).default
local SubscriptionPurchaseFlowTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.SubscriptionPurchaseFlowTelemetry)

function sendSubscriptionPurchaseFlowEvent(p1) --[[ Line: 7 ]]
	-- upvalues: Default (copy), SubscriptionPurchaseFlowTelemetryModule (copy)
	Default:logRobloxTelemetryEvent(SubscriptionPurchaseFlowTelemetryModule.SubscriptionPurchaseFlowEvent, {
		Default.StandardizedFields.addOsInfo,
		Default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1)
end

return sendSubscriptionPurchaseFlowEvent