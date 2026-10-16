local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local CreatePaymentSessionModule = require(RobloxSubscriptionPurchaseApp.Network.createPaymentSession)
local PerformRobloxSubscriptionPurchaseModule = require(RobloxSubscriptionPurchaseApp.Actions.performRobloxSubscriptionPurchase)
local RobloxSubscriptionHeadlessOverlayControllerModule = require(RobloxSubscriptionPurchaseApp.Flows.RobloxSubscriptionHeadlessOverlayController)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local GetAppFeaturePoliciesFunction = require(RobloxSubscriptionPurchaseApp.Parent.UniversalAppPolicy).getAppFeaturePolicies
local _ = require(RobloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)

return function(p1) --[[ Line: 40 | Named "startRobloxSubscriptionPurchaseFromUpsell" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), GetAppFeaturePoliciesFunction (copy), RobloxSubscriptionHeadlessOverlayControllerModule (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), PromptStateModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), CreatePaymentSessionModule (copy), PerformRobloxSubscriptionPurchaseModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local EntryContext = p1.entryContext
	GetResult.setRobloxSubscriptionProduct(p1.productDetails)
	GetResult.setOnFlowComplete(p1.onFlowComplete)
	GetResult.setPurchaseFlowOptions({
		skipWaitingForPurchaseResult = p1.skipWaitingForPurchaseResult == true
	})
	
	if EntryContext then
		GetResult.setEntryContext(EntryContext)
	end
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local RenderResult = RobloxSubscriptionHeadlessOverlayControllerModule.render()
	
	if GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		TransitionToErrorModule(ErrorReasonModule.UnsupportedPlatform, "startRobloxSubscriptionPurchaseFromUpsell")
		
		return RenderResult
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseRequested)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	CreatePaymentSessionModule(EntryContext):andThen(function(Result) --[[ Line: 76 ]]
		-- upvalues: GetResult (copy), PerformRobloxSubscriptionPurchaseModule (upval)
		GetResult.setPaymentSessionId(Result)
		PerformRobloxSubscriptionPurchaseModule()
	end)
	
	return RenderResult
end