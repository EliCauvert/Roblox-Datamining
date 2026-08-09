local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local createPaymentSessionModule = require(robloxSubscriptionPurchaseApp.Network.createPaymentSession)
local getRobloxSubscriptionProductsModule = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies

function initiateRobloxSubscriptionPurchaseInternal(p0) --[[ line: 29 ]]
	-- upvalues: logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), getAppFeaturePolicies (ref), transitionToErrorModule (ref), errorReasonModule (ref), robloxSubscriptionStoreModule (ref), promptStateModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), createPaymentSessionModule (ref), getRobloxSubscriptionProductsModule (ref), promiseModule (ref)
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalInitiatedCounter)
	
	if getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		transitionToErrorModule(errorReasonModule.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal")
		
		return
	end
	local var12 = robloxSubscriptionStoreModule.get()
	var12.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalOpen")
	end
	promiseModule.all({
		createPaymentSessionModule(p0),
		getRobloxSubscriptionProductsModule()
	}):andThen(function(p1) --[[ line: 50 ]]
		-- upvalues: var12 (ref), transitionToErrorModule (copy), errorReasonModule (copy), promptStateModule (copy)
		local var13 = p1[2]
		var12.setPaymentSessionId(p1[1])
		
		if #var13 > 0 then
			var12.setRobloxSubscriptionProduct(var13[1])
		else
			transitionToErrorModule(errorReasonModule.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal")
			
			return
		end
		var12.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
	end, function(_) --[[ line: 68 ]]
		-- upvalues: transitionToErrorModule (copy), errorReasonModule (copy)
		transitionToErrorModule(errorReasonModule.GenericError, "initiateRobloxSubscriptionPurchaseInternal")
	end)
end

return initiateRobloxSubscriptionPurchaseInternal