local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local LoggingProtocolModule = require(RobloxSubscriptionPurchaseApp.Parent.LoggingProtocol)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)

function logRobloxSubscriptionUpsellCounter(p1)
	-- upvalues: RobloxSubscriptionStoreModule (copy), SurfaceNameModule (copy), LoggingProtocolModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local EntryContext = GetResult.getEntryContext()
	local ErrorReason = GetResult.getErrorReason()
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, 1, {
		surface = if EntryContext then EntryContext.surfaceName else SurfaceNameModule.Unspecified,
		errorReason = ErrorReason and tostring(ErrorReason) or nil
	})
end

return logRobloxSubscriptionUpsellCounter