local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.types)
local createPaymentSessionModule = require(robloxSubscriptionPurchaseApp.Network.createPaymentSession)
local performRobloxSubscriptionPurchaseModule = require(robloxSubscriptionPurchaseApp.Actions.performRobloxSubscriptionPurchase)
local robloxSubscriptionHeadlessOverlayControllerModule = require(robloxSubscriptionPurchaseApp.Flows.RobloxSubscriptionHeadlessOverlayController)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local _ = require(robloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), getAppFeaturePolicies (ref), robloxSubscriptionHeadlessOverlayControllerModule (ref), transitionToErrorModule (ref), errorReasonModule (ref), promptStateModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), createPaymentSessionModule (ref), performRobloxSubscriptionPurchaseModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local entryContext = p1.entryContext
	var1.setRobloxSubscriptionProduct(p1.productDetails)
	var1.setOnFlowComplete(p1.onFlowComplete)
	var1.setPurchaseFlowOptions({
		skipWaitingForPurchaseResult = p1.skipWaitingForPurchaseResult == true
	})
	
	if entryContext then
		var1.setEntryContext(entryContext)
	end
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local var2 = robloxSubscriptionHeadlessOverlayControllerModule.render()
	
	if getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		transitionToErrorModule(errorReasonModule.UnsupportedPlatform, "startRobloxSubscriptionPurchaseFromUpsell")
		
		return var2
	end
	var1.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	createPaymentSessionModule(entryContext):andThen(function(p2)
		-- upvalues: var1 (ref), performRobloxSubscriptionPurchaseModule (copy)
		var1.setPaymentSessionId(p2)
		performRobloxSubscriptionPurchaseModule()
	end)
	
	return var2
end