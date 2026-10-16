local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local LoggingProtocolModule = require(RobloxSubscriptionPurchaseApp.Parent.LoggingProtocol)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(RobloxSubscriptionPurchaseApp.types)

function logRobloxSubscriptionUpsellTelemetryEvent(p1, List) --[[ Line: 12 ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), SurfaceNameModule (copy), LoggingProtocolModule (copy)
	local EntryContext = RobloxSubscriptionStoreModule.get().getEntryContext()
	local config = {
		surface = if EntryContext then EntryContext.surfaceName else SurfaceNameModule.Unspecified
	}
	
	if List then
		for i, value in List do
			config[i] = value
		end
	end
	LoggingProtocolModule.default:logRobloxTelemetryEvent(p1, {}, config)
end

return logRobloxSubscriptionUpsellTelemetryEvent