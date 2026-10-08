local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local loggingProtocolModule = require(robloxSubscriptionPurchaseApp.Parent.LoggingProtocol)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local fFlagEnablePlusReferralTelemetryModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralTelemetry)

function logRobloxSubscriptionUpsellCounter(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), surfaceNameModule (ref), fFlagEnablePlusReferralTelemetryModule (ref), loggingProtocolModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local entryContext = var1.getEntryContext()
	local errorReason = var1.getErrorReason()
	local var2 = if fFlagEnablePlusReferralTelemetryModule then var1.getReferrerId() else nil
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, 1, {
		surface = if entryContext then entryContext.surfaceName else surfaceNameModule.Unspecified,
		errorReason = errorReason and tostring(errorReason) or nil,
		isReferral = if if var2 and var2 > 0 then var2 else nil then "true" else nil
	})
end

return logRobloxSubscriptionUpsellCounter