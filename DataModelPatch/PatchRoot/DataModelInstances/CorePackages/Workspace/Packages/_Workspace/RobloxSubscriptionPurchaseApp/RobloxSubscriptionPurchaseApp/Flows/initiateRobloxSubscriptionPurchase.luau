local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local InitiateRobloxSubscriptionPurchaseInternalModule = require(RobloxSubscriptionPurchaseApp.Actions.initiateRobloxSubscriptionPurchaseInternal)
local RobloxSubscriptionOverlayControllerModule = require(RobloxSubscriptionPurchaseApp.Flows.RobloxSubscriptionOverlayController)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local SurfaceContextModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local FFlagRobloxPlusFAEFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)

return function(p1, p2, UniverseId, p3, p4, p5, p6)
	-- upvalues: RobloxSubscriptionStoreModule (copy), FFlagRobloxPlusFAEFreeTrialModule (copy), SurfaceContextModule (copy), SurfaceNameModule (copy), InitiateRobloxSubscriptionPurchaseInternalModule (copy), RobloxSubscriptionOverlayControllerModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	
	if p2 then
		if p2.onFlowComplete then
			GetResult.setOnFlowComplete(p2.onFlowComplete)
		end
		if p2.onBackButtonActivated then
			GetResult.setOnBackButtonActivated(p2.onBackButtonActivated)
		end
		if FFlagRobloxPlusFAEFreeTrialModule and p2.onCtaOverride then
			GetResult.setOnCtaOverride(p2.onCtaOverride)
		end
	end
	if p1 then
		GetResult.setPurchaseUIOptions(p1)
	end
	if p5 then
		GetResult.setPurchaseFlowOptions(p5)
	end
	local Metadata = {}
	
	if UniverseId ~= nil then
		Metadata.universeId = UniverseId
	end
	local config = {
		context = p4 or SurfaceContextModule.Unspecified,
		surfaceName = p3 or SurfaceNameModule.Unspecified,
		metadata = Metadata,
		clientSessionId = if p6 then p6.clientSessionId else nil
	}
	GetResult.setEntryContext(config)
	InitiateRobloxSubscriptionPurchaseInternalModule(config)
	
	return RobloxSubscriptionOverlayControllerModule.render()
end