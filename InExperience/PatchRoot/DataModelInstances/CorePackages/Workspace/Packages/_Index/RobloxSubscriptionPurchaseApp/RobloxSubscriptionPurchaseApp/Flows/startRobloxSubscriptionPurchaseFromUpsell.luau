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

return function(p0) --[[ line: 40 | named "startRobloxSubscriptionPurchaseFromUpsell" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), getAppFeaturePolicies (ref), robloxSubscriptionHeadlessOverlayControllerModule (ref), transitionToErrorModule (ref), errorReasonModule (ref), promptStateModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), createPaymentSessionModule (ref), performRobloxSubscriptionPurchaseModule (ref)
	local var12 = robloxSubscriptionStoreModule.get()
	local entryContext = p0.entryContext
	var12.setRobloxSubscriptionProduct(p0.productDetails)
	var12.setOnFlowComplete(p0.onFlowComplete)
	var12.setPurchaseFlowOptions({
		skipWaitingForPurchaseResult = p0.skipWaitingForPurchaseResult == true
	})
	
	if entryContext then
		var12.setEntryContext(entryContext)
	end
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local var13 = robloxSubscriptionHeadlessOverlayControllerModule.render()
	
	if getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		transitionToErrorModule(errorReasonModule.UnsupportedPlatform, "startRobloxSubscriptionPurchaseFromUpsell")
		
		return var13
	end
	var12.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	createPaymentSessionModule(entryContext):andThen(function(p1) --[[ line: 76 ]]
		-- upvalues: var12 (ref), performRobloxSubscriptionPurchaseModule (copy)
		var12.setPaymentSessionId(p1)
		performRobloxSubscriptionPurchaseModule()
	end)
	
	return var13
end