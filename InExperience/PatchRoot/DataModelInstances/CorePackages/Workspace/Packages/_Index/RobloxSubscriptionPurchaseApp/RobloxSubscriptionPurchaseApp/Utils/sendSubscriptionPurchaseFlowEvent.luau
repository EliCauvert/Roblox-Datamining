local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local default = require(robloxSubscriptionPurchaseApp.Parent.LoggingProtocol).default
local subscriptionPurchaseFlowTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.SubscriptionPurchaseFlowTelemetry)

function sendSubscriptionPurchaseFlowEvent(p0) --[[ line: 7 ]]
	-- upvalues: default (ref), subscriptionPurchaseFlowTelemetryModule (ref)
	default:logRobloxTelemetryEvent(subscriptionPurchaseFlowTelemetryModule.SubscriptionPurchaseFlowEvent, {
		default.StandardizedFields.addOsInfo,
		default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p0)
end

return sendSubscriptionPurchaseFlowEvent