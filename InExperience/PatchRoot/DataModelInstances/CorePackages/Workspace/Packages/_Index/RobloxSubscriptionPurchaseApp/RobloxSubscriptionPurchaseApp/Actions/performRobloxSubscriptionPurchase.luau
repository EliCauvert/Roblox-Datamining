local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local marketplaceService = game:GetService("MarketplaceService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local getSubscriptionPurchaseUrlModule = require(robloxSubscriptionPurchaseApp.Utils.getSubscriptionPurchaseUrl)
local webViewServiceWrapperModule = require(robloxSubscriptionPurchaseApp.Utils.WebViewServiceWrapper)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local constantsModule = require(robloxSubscriptionPurchaseApp.Constants)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local fFlagEnableStudioMockPurchaseRobloxSubscriptionModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableStudioMockPurchaseRobloxSubscription)
local fFlagEnablePlusReferralLandingSheet = require(robloxSubscriptionPurchaseApp.Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local fStringBlackbirdWebviewHeaderName = game:DefineFastString("FStringBlackbirdWebviewHeaderName", "Black bird")
local enableSubscriptionPurchaseReferrerIdEngineFeature = game:GetEngineFeature("EnableSubscriptionPurchaseReferrerId")

local function _(p1)
	return if p1 == Enum.Platform.IOS then "AppleAppStore" elseif p1 == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
end

function performRobloxSubscriptionPurchase()
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagEnableStudioMockPurchaseRobloxSubscriptionModule (ref), runService (ref), marketplaceService (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), userInputService (ref), fFlagEnablePlusReferralLandingSheet (ref), promptStateModule (ref), webViewServiceWrapperModule (ref), getSubscriptionPurchaseUrlModule (ref), fStringBlackbirdWebviewHeaderName (ref), enableSubscriptionPurchaseReferrerIdEngineFeature (ref), constantsModule (ref), transitionToErrorModule (ref), errorReasonModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local robloxSubscriptionProductId = var1.getRobloxSubscriptionProductId()
	local paymentSessionId = var1.getPaymentSessionId()
	
	if robloxSubscriptionProductId == nil then return end
	if fFlagEnableStudioMockPurchaseRobloxSubscriptionModule and runService:IsStudio() then
		marketplaceService:SignalMockPurchaseRobloxSubscription()
		var1.setDidTryPurchasing(true)
		completeRobloxSubscriptionUpsellFlowModule()
		
		return
	elseif fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseAttempted")
	end
	local platform = userInputService:GetPlatform()
	local var2 = if fFlagEnablePlusReferralLandingSheet then var1.getReferrerId() else nil
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.Linux else true else true then
		var1.setIsNativePurchase(false)
		var1.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
		webViewServiceWrapperModule.new({
			url = getSubscriptionPurchaseUrlModule(robloxSubscriptionProductId, paymentSessionId, var2),
			title = fStringBlackbirdWebviewHeaderName,
			closeCallback = function()
				-- upvalues: var1 (ref), completeRobloxSubscriptionUpsellFlowModule (copy)
				var1.setDidTryPurchasing(true)
				completeRobloxSubscriptionUpsellFlowModule()
			end,
			onOpenCallback = function()
				-- upvalues: var1 (ref), promptStateModule (copy)
				var1.setPromptState(promptStateModule.SubscriptionPurchaseInProgress)
			end
		}):open()
		
		return
	end
	var1.setPromptState(promptStateModule.SubscriptionPurchaseInProgress)
	local var3 = if platform == Enum.Platform.IOS then "AppleAppStore" elseif platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
	var1.setIsNativePurchase(true)
	local ok, _ = pcall(function()
		-- upvalues: fFlagEnablePlusReferralLandingSheet (copy), enableSubscriptionPurchaseReferrerIdEngineFeature (copy), var2 (ref), marketplaceService (copy), constantsModule (copy), robloxSubscriptionProductId (ref), var3 (ref), paymentSessionId (ref)
		if fFlagEnablePlusReferralLandingSheet and enableSubscriptionPurchaseReferrerIdEngineFeature and var2 then
			marketplaceService:PerformSubscriptionPurchaseV3Async(constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, robloxSubscriptionProductId, var3, paymentSessionId, var2)
			
			return
		end
		marketplaceService:PerformSubscriptionPurchaseV3Async(constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, robloxSubscriptionProductId, var3, paymentSessionId)
	end)
	
	if not ok then
		transitionToErrorModule(errorReasonModule.GenericError, "performRobloxSubscriptionPurchase")
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellPurchaseFailedCounter)
	end
end

return performRobloxSubscriptionPurchase