local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local FFlagEnablePlusReferralTelemetryModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralTelemetry)
local FFlagEnablePlusReferralEntrypointTelemetry = require(Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry

function logRobloxSubscriptionUpsellCounter(p1) --[[ Line: 17 ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), SurfaceNameModule (copy), FFlagEnablePlusReferralTelemetryModule (copy), FFlagEnablePlusReferralEntrypointTelemetry (copy), LoggingProtocolModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local EntryContext = GetResult.getEntryContext()
	local ErrorReason = GetResult.getErrorReason()
	local ReferrerId = if FFlagEnablePlusReferralTelemetryModule then GetResult.getReferrerId() else nil
	local ReferrerId1 = if ReferrerId and ReferrerId > 0 then ReferrerId else nil
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, 1, {
		surface = if EntryContext then EntryContext.surfaceName else SurfaceNameModule.Unspecified,
		errorReason = ErrorReason and tostring(ErrorReason) or nil,
		isReferral = if ReferrerId1 then "true" else nil,
		entrypoint = if FFlagEnablePlusReferralEntrypointTelemetry and EntryContext then EntryContext.entrypoint else nil
	})
end

return logRobloxSubscriptionUpsellCounter