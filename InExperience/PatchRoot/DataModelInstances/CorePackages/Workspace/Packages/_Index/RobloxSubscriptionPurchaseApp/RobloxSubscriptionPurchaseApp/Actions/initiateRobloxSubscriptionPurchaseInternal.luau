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
local FFlagPlusSubscribeDeepLinkIncludeUpgrades = require(Parent.SharedFlags).FFlagPlusSubscribeDeepLinkIncludeUpgrades
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)
local RobloxPlusSheetKindModule = require(RobloxSubscriptionPurchaseApp.Enums.RobloxPlusSheetKind)
local FFlagPlusMembershipConfigChangeCheck = require(Parent.SharedFlags).FFlagPlusMembershipConfigChangeCheck
local GetRobloxSubscriptionMembershipConfigModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionMembershipConfig)
local ResetPerFlowStateModule = require(RobloxSubscriptionPurchaseApp.Actions.resetPerFlowState)
local RobloxSubscriptionSignalsModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionSignals)
local FetchReferralEligibilityModule = require(RobloxSubscriptionPurchaseApp.Network.fetchReferralEligibility)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local AmpAccessResponseModule = require(RobloxSubscriptionPurchaseApp.Enums.AmpAccessResponse)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local config = {
	[require(RobloxSubscriptionPurchaseApp.Enums.ReferralIneligibilityReason).RecipientSelfReferral] = ErrorReasonModule.ReferralSelfReferral
}

function initiateRobloxSubscriptionPurchaseInternal(p1)
	-- upvalues: LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), RobloxSubscriptionStoreModule (copy), FFlagPlusMembershipConfigChangeCheck (copy), ResetPerFlowStateModule (copy), GetAppFeaturePoliciesFunction (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), FFlagTTOnboardingSheetModule (copy), RobloxPlusSheetKindModule (copy), PromptStateModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), CreatePaymentSessionModule (copy), FFlagEnablePlusReferralLandingSheet (copy), FFlagPlusSubscribeDeepLinkIncludeUpgrades (copy), FFlagRobloxSubscriptionProductsDirectFetchModule (copy), GetRobloxSubscriptionProductsDirectModule (copy), GetRobloxSubscriptionProductsModule (copy), FFlagRobloxPlusAmpSubscriptionCheckModule (copy), GetAmpFeatureAccessModule (copy), FetchReferralEligibilityModule (copy), RobloxSubscriptionSignalsModule (copy), GetRobloxSubscriptionMembershipConfigModule (copy), PromiseModule (copy), AmpAccessResponseModule (copy), config (copy)
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local GetResult = RobloxSubscriptionStoreModule.get()
	
	if FFlagPlusMembershipConfigChangeCheck then
		ResetPerFlowStateModule()
	end
	local PurchaseUIOptions = GetResult.getPurchaseUIOptions()
	
	if (PurchaseUIOptions == nil or not PurchaseUIOptions.skipGuacPolicy) and GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		TransitionToErrorModule(ErrorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	if FFlagTTOnboardingSheetModule and PurchaseUIOptions and PurchaseUIOptions.sheetKind == RobloxPlusSheetKindModule.TT then
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
		
		return
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseRequested)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	local ReferrerId = if FFlagEnablePlusReferralLandingSheet then GetResult.getReferrerId() else nil
	local ReferrerId1 = if ReferrerId and ReferrerId > 0 then ReferrerId else nil
	local IsIncludeUpgrades = if FFlagPlusSubscribeDeepLinkIncludeUpgrades and FFlagRobloxSubscriptionProductsDirectFetchModule then GetResult.getPurchaseFlowOptions().includeUpgrades == true else nil
	local NoIsIncludeUpgrades: boolean = FFlagRobloxPlusAmpSubscriptionCheckModule and not IsIncludeUpgrades
	local List = {
		CreatePaymentSessionModule(p1),
		if FFlagRobloxSubscriptionProductsDirectFetchModule then GetRobloxSubscriptionProductsDirectModule(ReferrerId1, IsIncludeUpgrades) else GetRobloxSubscriptionProductsModule()
	}
	
	if NoIsIncludeUpgrades then
		table.insert(List, GetAmpFeatureAccessModule())
	end
	if FFlagEnablePlusReferralLandingSheet and ReferrerId1 then
		table.insert(List, FetchReferralEligibilityModule(ReferrerId1))
	end
	local Count: number? = nil
	
	if FFlagPlusMembershipConfigChangeCheck and IsIncludeUpgrades and RobloxSubscriptionSignalsModule.get().getHasRobloxSubscription() then
		table.insert(List, GetRobloxSubscriptionMembershipConfigModule())
		Count = #List
	end
	PromiseModule.all(List):andThen(function(Entry)
		-- upvalues: NoIsIncludeUpgrades (copy), AmpAccessResponseModule (upval), TransitionToErrorModule (upval), ErrorReasonModule (upval), FFlagEnablePlusReferralLandingSheet (upval), ReferrerId1 (copy), config (upval), Count (ref), GetResult (copy), PromptStateModule (upval)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		
		if NoIsIncludeUpgrades and Entry[3] == AmpAccessResponseModule.Granted then
			TransitionToErrorModule(ErrorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		if FFlagEnablePlusReferralLandingSheet and ReferrerId1 then
			local Entry3 = Entry[if NoIsIncludeUpgrades then 4 else 3]
			
			if not Entry3.eligible then
				TransitionToErrorModule(config[Entry3.reason] or ErrorReasonModule.ReferralIneligible, "initiateRobloxSubscriptionPurchaseInternal")
				
				return
			end
		end
		if Count then
			local Entry4 = Entry[Count]
			
			if Entry4 == nil then
				TransitionToErrorModule(ErrorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
				
				return
			end
			GetResult.setMembershipConfigSnapshot(Entry4)
		end
		GetResult.setPaymentSessionId(Entry1)
		
		if #Entry2 <= 0 then
			TransitionToErrorModule(ErrorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		GetResult.setRobloxSubscriptionProduct(Entry2[1])
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
	end, function(_)
		-- upvalues: TransitionToErrorModule (upval), ErrorReasonModule (upval)
		TransitionToErrorModule(ErrorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal