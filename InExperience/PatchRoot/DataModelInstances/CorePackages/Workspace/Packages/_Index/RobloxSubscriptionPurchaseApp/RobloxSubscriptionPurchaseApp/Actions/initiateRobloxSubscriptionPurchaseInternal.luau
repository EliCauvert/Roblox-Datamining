local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local createPaymentSessionModule = require(robloxSubscriptionPurchaseApp.Network.createPaymentSession)
local getRobloxSubscriptionProductsModule = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local getRobloxSubscriptionProductsDirectModule = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProductsDirect)
local fFlagRobloxSubscriptionProductsDirectFetchModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxSubscriptionProductsDirectFetch)
local getAmpFeatureAccessModule = require(robloxSubscriptionPurchaseApp.Network.getAmpFeatureAccess)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local fFlagRobloxPlusAmpSubscriptionCheckModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusAmpSubscriptionCheck)
local fFlagEnablePlusReferralLandingSheet = require(parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local fetchReferralEligibilityModule = require(robloxSubscriptionPurchaseApp.Network.fetchReferralEligibility)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local referralIneligibilityReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ReferralIneligibilityReason)
local ampAccessResponseModule = require(robloxSubscriptionPurchaseApp.Enums.AmpAccessResponse)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local t = {
	[referralIneligibilityReasonModule.RecipientSelfReferral] = errorReasonModule.ReferralSelfReferral
}

function initiateRobloxSubscriptionPurchaseInternal(p1)
	-- upvalues: logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), robloxSubscriptionStoreModule (ref), getAppFeaturePolicies (ref), transitionToErrorModule (ref), errorReasonModule (ref), promptStateModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), createPaymentSessionModule (ref), fFlagEnablePlusReferralLandingSheet (ref), fFlagRobloxSubscriptionProductsDirectFetchModule (ref), getRobloxSubscriptionProductsDirectModule (ref), getRobloxSubscriptionProductsModule (ref), fFlagRobloxPlusAmpSubscriptionCheckModule (ref), getAmpFeatureAccessModule (ref), fetchReferralEligibilityModule (ref), promiseModule (ref), ampAccessResponseModule (ref), t (ref)
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local var1 = robloxSubscriptionStoreModule.get()
	local purchaseUIOptions = var1.getPurchaseUIOptions()
	
	if if not (purchaseUIOptions == nil or not purchaseUIOptions.skipGuacPolicy) then false else getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		transitionToErrorModule(errorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	var1.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	local var2 = createPaymentSessionModule(p1)
	local var3 = if fFlagEnablePlusReferralLandingSheet then var1.getReferrerId() else nil
	local var4 = if var3 and var3 > 0 then var3 else nil
	local list = {
		var2,
		if fFlagRobloxSubscriptionProductsDirectFetchModule then getRobloxSubscriptionProductsDirectModule(var4) else getRobloxSubscriptionProductsModule()
	}
	
	if fFlagRobloxPlusAmpSubscriptionCheckModule then
		table.insert(list, getAmpFeatureAccessModule())
	end
	if fFlagEnablePlusReferralLandingSheet and var4 then
		table.insert(list, fetchReferralEligibilityModule(var4))
	end
	promiseModule.all(list):andThen(function(p2)
		-- upvalues: fFlagRobloxPlusAmpSubscriptionCheckModule (copy), ampAccessResponseModule (copy), transitionToErrorModule (copy), errorReasonModule (copy), fFlagEnablePlusReferralLandingSheet (copy), var4 (ref), t (copy), var1 (ref), promptStateModule (copy)
		local var5 = p2[1]
		local var6 = p2[2]
		
		if fFlagRobloxPlusAmpSubscriptionCheckModule and p2[3] == ampAccessResponseModule.Granted then
			transitionToErrorModule(errorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		elseif fFlagEnablePlusReferralLandingSheet and var4 then
			local var7 = p2[if fFlagRobloxPlusAmpSubscriptionCheckModule then 4 else 3]
			
			if not var7.eligible then
				transitionToErrorModule(t[var7.reason] or errorReasonModule.ReferralIneligible, "initiateRobloxSubscriptionPurchaseInternal")
				
				return
			end
		end
		var1.setPaymentSessionId(var5)
		
		if #var6 > 0 then
			var1.setRobloxSubscriptionProduct(var6[1])
		else
			transitionToErrorModule(errorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		var1.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
	end, function(_)
		-- upvalues: transitionToErrorModule (copy), errorReasonModule (copy)
		transitionToErrorModule(errorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal