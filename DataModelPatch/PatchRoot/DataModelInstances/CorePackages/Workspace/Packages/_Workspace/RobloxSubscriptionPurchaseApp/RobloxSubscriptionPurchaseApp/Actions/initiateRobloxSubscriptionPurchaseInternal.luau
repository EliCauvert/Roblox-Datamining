local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local PromiseModule = require(Parent.Promise)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local CreatePaymentSessionModule = require(RobloxSubscriptionPurchaseApp.Network.createPaymentSession)
local GetRobloxSubscriptionProductsModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local FFlagRobloxPlusFAEFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies

function initiateRobloxSubscriptionPurchaseInternal(p1)
	-- upvalues: LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), RobloxSubscriptionStoreModule (copy), FFlagRobloxPlusFAEFreeTrialModule (copy), GetAppFeaturePoliciesFunction (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), PromptStateModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), CreatePaymentSessionModule (copy), GetRobloxSubscriptionProductsModule (copy), PromiseModule (copy)
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local PurchaseUIOptions = if FFlagRobloxPlusFAEFreeTrialModule then GetResult.getPurchaseUIOptions() else nil
	
	if (not FFlagRobloxPlusFAEFreeTrialModule or PurchaseUIOptions == nil or not PurchaseUIOptions.skipGuacPolicy) and GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		TransitionToErrorModule(ErrorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseRequested)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	PromiseModule.all({
		CreatePaymentSessionModule(p1),
		(GetRobloxSubscriptionProductsModule())
	}):andThen(function(Entry)
		-- upvalues: GetResult (copy), TransitionToErrorModule (upval), ErrorReasonModule (upval), PromptStateModule (upval)
		local Entry1 = Entry[2]
		GetResult.setPaymentSessionId(Entry[1])
		
		if #Entry1 <= 0 then
			TransitionToErrorModule(ErrorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		GetResult.setRobloxSubscriptionProduct(Entry1[1])
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
	end, function(_)
		-- upvalues: TransitionToErrorModule (upval), ErrorReasonModule (upval)
		TransitionToErrorModule(ErrorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal