local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local PromiseModule = require(Parent.Promise)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local CreatePaymentSessionModule = require(RobloxSubscriptionPurchaseApp.Network.createPaymentSession)
local GetRobloxSubscriptionProductsModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local GetRobloxSubscriptionProductsDirectModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProductsDirect)
local FFlagRobloxSubscriptionProductsDirectFetchModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxSubscriptionProductsDirectFetch)
local GetAmpFeatureAccessModule = require(RobloxSubscriptionPurchaseApp.Network.getAmpFeatureAccess)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local FFlagRobloxPlusAmpSubscriptionCheckModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusAmpSubscriptionCheck)
local FFlagEnablePlusReferralLandingSheet = require(Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local FetchReferralEligibilityModule = require(RobloxSubscriptionPurchaseApp.Network.fetchReferralEligibility)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local AmpAccessResponseModule = require(RobloxSubscriptionPurchaseApp.Enums.AmpAccessResponse)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local config = {
	[require(RobloxSubscriptionPurchaseApp.Enums.ReferralIneligibilityReason).RecipientSelfReferral] = ErrorReasonModule.ReferralSelfReferral
}

function initiateRobloxSubscriptionPurchaseInternal(p1) --[[ Line: 42 ]]
	-- upvalues: LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), RobloxSubscriptionStoreModule (copy), GetAppFeaturePoliciesFunction (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), PromptStateModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), CreatePaymentSessionModule (copy), FFlagEnablePlusReferralLandingSheet (copy), FFlagRobloxSubscriptionProductsDirectFetchModule (copy), GetRobloxSubscriptionProductsDirectModule (copy), GetRobloxSubscriptionProductsModule (copy), FFlagRobloxPlusAmpSubscriptionCheckModule (copy), GetAmpFeatureAccessModule (copy), FetchReferralEligibilityModule (copy), PromiseModule (copy), AmpAccessResponseModule (copy), config (copy)
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local PurchaseUIOptions = GetResult.getPurchaseUIOptions()
	
	if (PurchaseUIOptions == nil or not PurchaseUIOptions.skipGuacPolicy) and GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		TransitionToErrorModule(ErrorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseRequested)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	local ReferrerId = if FFlagEnablePlusReferralLandingSheet then GetResult.getReferrerId() else nil
	local ReferrerId1 = if ReferrerId and ReferrerId > 0 then ReferrerId else nil
	local List = {
		CreatePaymentSessionModule(p1),
		if FFlagRobloxSubscriptionProductsDirectFetchModule then GetRobloxSubscriptionProductsDirectModule(ReferrerId1) else GetRobloxSubscriptionProductsModule()
	}
	
	if FFlagRobloxPlusAmpSubscriptionCheckModule then
		table.insert(List, GetAmpFeatureAccessModule())
	end
	if FFlagEnablePlusReferralLandingSheet and ReferrerId1 then
		table.insert(List, FetchReferralEligibilityModule(ReferrerId1))
	end
	PromiseModule.all(List):andThen(function(Entry) --[[ Line: 83 ]]
		-- upvalues: FFlagRobloxPlusAmpSubscriptionCheckModule (upval), AmpAccessResponseModule (upval), TransitionToErrorModule (upval), ErrorReasonModule (upval), FFlagEnablePlusReferralLandingSheet (upval), ReferrerId1 (copy), config (upval), GetResult (copy), PromptStateModule (upval)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		
		if FFlagRobloxPlusAmpSubscriptionCheckModule and Entry[3] == AmpAccessResponseModule.Granted then
			TransitionToErrorModule(ErrorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		if FFlagEnablePlusReferralLandingSheet and ReferrerId1 then
			local Entry3 = Entry[if FFlagRobloxPlusAmpSubscriptionCheckModule then 4 else 3]
			
			if not Entry3.eligible then
				TransitionToErrorModule(config[Entry3.reason] or ErrorReasonModule.ReferralIneligible, "initiateRobloxSubscriptionPurchaseInternal")
				
				return
			end
		end
		GetResult.setPaymentSessionId(Entry1)
		
		if #Entry2 <= 0 then
			TransitionToErrorModule(ErrorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		GetResult.setRobloxSubscriptionProduct(Entry2[1])
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
	end, function(_) --[[ Line: 120 ]]
		-- upvalues: TransitionToErrorModule (upval), ErrorReasonModule (upval)
		TransitionToErrorModule(ErrorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal