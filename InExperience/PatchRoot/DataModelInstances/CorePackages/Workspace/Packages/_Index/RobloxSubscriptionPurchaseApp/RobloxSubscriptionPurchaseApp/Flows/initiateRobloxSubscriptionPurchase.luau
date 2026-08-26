local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local initiateRobloxSubscriptionPurchaseInternalModule = require(robloxSubscriptionPurchaseApp.Actions.initiateRobloxSubscriptionPurchaseInternal)
local robloxSubscriptionOverlayControllerModule = require(robloxSubscriptionPurchaseApp.Flows.RobloxSubscriptionOverlayController)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local surfaceContextModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local _ = require(robloxSubscriptionPurchaseApp.types)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), surfaceContextModule (ref), surfaceNameModule (ref), initiateRobloxSubscriptionPurchaseInternalModule (ref), robloxSubscriptionOverlayControllerModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	
	if p2 then
		if p2.onFlowComplete then
			var1.setOnFlowComplete(p2.onFlowComplete)
		end
		if p2.onBackButtonActivated then
			var1.setOnBackButtonActivated(p2.onBackButtonActivated)
		end
		if fFlagRobloxPlusFAEFreeTrialModule and p2.onCtaOverride then
			var1.setOnCtaOverride(p2.onCtaOverride)
		end
	end
	if p1 then
		var1.setPurchaseUIOptions(p1)
	end
	if p6 then
		var1.setPurchaseFlowOptions(p6)
	end
	local t = {}
	
	if p3 ~= nil then
		t.universeId = p3
	end
	local t_1 = {
		context = p5 or surfaceContextModule.Unspecified,
		surfaceName = p4 or surfaceNameModule.Unspecified,
		metadata = t,
		clientSessionId = if p7 then p7.clientSessionId else nil
	}
	var1.setEntryContext(t_1)
	initiateRobloxSubscriptionPurchaseInternalModule(t_1)
	
	return robloxSubscriptionOverlayControllerModule.render()
end