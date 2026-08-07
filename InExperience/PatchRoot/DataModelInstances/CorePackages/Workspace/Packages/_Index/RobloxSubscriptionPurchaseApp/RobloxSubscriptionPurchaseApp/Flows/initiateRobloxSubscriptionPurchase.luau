local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local initiateRobloxSubscriptionPurchaseInternalModule = require(robloxSubscriptionPurchaseApp.Actions.initiateRobloxSubscriptionPurchaseInternal)
local robloxSubscriptionOverlayControllerModule = require(robloxSubscriptionPurchaseApp.Flows.RobloxSubscriptionOverlayController)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local surfaceContextModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local _ = require(robloxSubscriptionPurchaseApp.types)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 18 | named "initiateRobloxSubscriptionPurchase" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), surfaceContextModule (ref), surfaceNameModule (ref), initiateRobloxSubscriptionPurchaseInternalModule (ref), robloxSubscriptionOverlayControllerModule (ref)
	local var7 = robloxSubscriptionStoreModule.get()
	
	if p1 then
		if p1.onFlowComplete then
			var7.setOnFlowComplete(p1.onFlowComplete)
		end
		if p1.onBackButtonActivated then
			var7.setOnBackButtonActivated(p1.onBackButtonActivated)
		end
		if fFlagRobloxPlusFAEFreeTrialModule and p1.onCtaOverride then
			var7.setOnCtaOverride(p1.onCtaOverride)
		end
	end
	if p0 then
		var7.setPurchaseUIOptions(p0)
	end
	if p5 then
		var7.setPurchaseFlowOptions(p5)
	end
	local t = {}
	
	if p2 ~= nil then
		t.universeId = p2
	end
	local t_1 = {
		context = p4 or surfaceContextModule.Unspecified,
		surfaceName = p3 or surfaceNameModule.Unspecified,
		metadata = t,
		clientSessionId = if p6 then p6.clientSessionId else nil
	}
	var7.setEntryContext(t_1)
	initiateRobloxSubscriptionPurchaseInternalModule(t_1)
	
	return robloxSubscriptionOverlayControllerModule.render()
end