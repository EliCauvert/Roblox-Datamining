local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local loggingProtocolModule = require(robloxSubscriptionPurchaseApp.Parent.LoggingProtocol)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(robloxSubscriptionPurchaseApp.types)

function logRobloxSubscriptionUpsellTelemetryEvent(p0, p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), surfaceNameModule (ref), loggingProtocolModule (ref)
	local entryContext = robloxSubscriptionStoreModule.get().getEntryContext()
	local t = {
		surface = if entryContext then entryContext.surfaceName else surfaceNameModule.Unspecified
	}
	
	if p1 then
		for i, v in p1 do
			t[i] = v
		end
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(p0, {}, t)
end

return logRobloxSubscriptionUpsellTelemetryEvent