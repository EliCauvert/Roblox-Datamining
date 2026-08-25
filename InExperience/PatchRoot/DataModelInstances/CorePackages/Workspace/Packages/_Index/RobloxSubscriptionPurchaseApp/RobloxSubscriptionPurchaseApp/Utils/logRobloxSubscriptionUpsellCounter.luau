local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local loggingProtocolModule = require(robloxSubscriptionPurchaseApp.Parent.LoggingProtocol)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)

function logRobloxSubscriptionUpsellCounter(p0)
	-- upvalues: robloxSubscriptionStoreModule (ref), surfaceNameModule (ref), loggingProtocolModule (ref)
	local var4 = robloxSubscriptionStoreModule.get()
	local entryContext = var4.getEntryContext()
	local errorReason = var4.getErrorReason()
	loggingProtocolModule.default:logRobloxTelemetryCounter(p0, 1, {
		surface = if entryContext then entryContext.surfaceName else surfaceNameModule.Unspecified,
		errorReason = errorReason and tostring(errorReason) or nil
	})
end

return logRobloxSubscriptionUpsellCounter