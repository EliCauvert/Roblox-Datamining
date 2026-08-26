local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local default = require(robloxSubscriptionPurchaseApp.Parent.LoggingProtocol).default
local subscriptionPurchaseFlowTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.SubscriptionPurchaseFlowTelemetry)

function sendSubscriptionPurchaseFlowEvent(p1)
	-- upvalues: default (ref), subscriptionPurchaseFlowTelemetryModule (ref)
	default:logRobloxTelemetryEvent(subscriptionPurchaseFlowTelemetryModule.SubscriptionPurchaseFlowEvent, {
		default.StandardizedFields.addOsInfo,
		default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1)
end

return sendSubscriptionPurchaseFlowEvent