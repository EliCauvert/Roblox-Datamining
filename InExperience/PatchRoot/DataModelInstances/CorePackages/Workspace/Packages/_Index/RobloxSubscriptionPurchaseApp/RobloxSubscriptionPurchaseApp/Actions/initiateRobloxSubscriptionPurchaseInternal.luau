local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local createPaymentSessionModule = require(robloxSubscriptionPurchaseApp.Network.createPaymentSession)
local getRobloxSubscriptionProductsModule = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local getAmpFeatureAccessModule = require(robloxSubscriptionPurchaseApp.Network.getAmpFeatureAccess)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local fFlagRobloxPlusAmpSubscriptionCheckModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusAmpSubscriptionCheck)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local ampAccessResponseModule = require(robloxSubscriptionPurchaseApp.Enums.AmpAccessResponse)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies

function initiateRobloxSubscriptionPurchaseInternal(p0)
	-- upvalues: logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), getAppFeaturePolicies (ref), transitionToErrorModule (ref), errorReasonModule (ref), promptStateModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), createPaymentSessionModule (ref), getRobloxSubscriptionProductsModule (ref), fFlagRobloxPlusAmpSubscriptionCheckModule (ref), getAmpFeatureAccessModule (ref), promiseModule (ref), ampAccessResponseModule (ref)
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	local var16 = robloxSubscriptionStoreModule.get()
	local var17 = if fFlagRobloxPlusFAEFreeTrialModule then var16.getPurchaseUIOptions() else nil
	
	if if fFlagRobloxPlusFAEFreeTrialModule and var17 ~= nil and var17.skipGuacPolicy then false else getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		transitionToErrorModule(errorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	var16.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	local list = {
		createPaymentSessionModule(p0),
		getRobloxSubscriptionProductsModule()
	}
	
	if fFlagRobloxPlusAmpSubscriptionCheckModule then
		table.insert(list, getAmpFeatureAccessModule())
	end
	promiseModule.all(list):andThen(function(p1)
		-- upvalues: fFlagRobloxPlusAmpSubscriptionCheckModule (copy), ampAccessResponseModule (copy), transitionToErrorModule (copy), errorReasonModule (copy), var16 (ref), promptStateModule (copy)
		local var19 = p1[1]
		local var20 = p1[2]
		
		if fFlagRobloxPlusAmpSubscriptionCheckModule and p1[3] == ampAccessResponseModule.Granted then
			transitionToErrorModule(errorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		var16.setPaymentSessionId(var19)
		
		if #var20 > 0 then
			var16.setRobloxSubscriptionProduct(var20[1])
		else
			transitionToErrorModule(errorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		var16.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
	end, function(_)
		-- upvalues: transitionToErrorModule (copy), errorReasonModule (copy)
		transitionToErrorModule(errorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal