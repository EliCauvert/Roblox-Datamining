local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local GetSubscriptionPurchaseUrlModule = require(RobloxSubscriptionPurchaseApp.Utils.getSubscriptionPurchaseUrl)
local WebViewServiceWrapperModule = require(RobloxSubscriptionPurchaseApp.Utils.WebViewServiceWrapper)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local ConstantsModule = require(RobloxSubscriptionPurchaseApp.Constants)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local FFlagEnableStudioMockPurchaseRobloxSubscriptionModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableStudioMockPurchaseRobloxSubscription)
local FFlagEnablePlusReferralLandingSheet = require(RobloxSubscriptionPurchaseApp.Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local FStringBlackbirdWebviewHeaderName = game:DefineFastString("FStringBlackbirdWebviewHeaderName", "Black bird")
local EnableSubscriptionPurchaseReferrerIdEngineFeature = game:GetEngineFeature("EnableSubscriptionPurchaseReferrerId")

local function _(Platform): string --[[ Line: 36 | Named "getPaymentProviderForPlatform" ]]
	return if Platform == Enum.Platform.IOS then "AppleAppStore" elseif Platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
end

function performRobloxSubscriptionPurchase() --[[ Line: 46 ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), FFlagEnableStudioMockPurchaseRobloxSubscriptionModule (copy), RunService (copy), MarketplaceService (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), UserInputService (copy), FFlagEnablePlusReferralLandingSheet (copy), PromptStateModule (copy), WebViewServiceWrapperModule (copy), GetSubscriptionPurchaseUrlModule (copy), FStringBlackbirdWebviewHeaderName (copy), EnableSubscriptionPurchaseReferrerIdEngineFeature (copy), ConstantsModule (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local RobloxSubscriptionProductId = GetResult.getRobloxSubscriptionProductId()
	local PaymentSessionId = GetResult.getPaymentSessionId()
	
	if RobloxSubscriptionProductId == nil then return end
	if FFlagEnableStudioMockPurchaseRobloxSubscriptionModule and RunService:IsStudio() then
		MarketplaceService:SignalMockPurchaseRobloxSubscription()
		GetResult.setDidTryPurchasing(true)
		CompleteRobloxSubscriptionUpsellFlowModule()
		
		return
	end
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseAttempted")
	end
	local Platform = UserInputService:GetPlatform()
	local ReferrerId = if FFlagEnablePlusReferralLandingSheet then GetResult.getReferrerId() else nil
	
	if Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux) then
		GetResult.setIsNativePurchase(false)
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
		WebViewServiceWrapperModule.new({
			url = GetSubscriptionPurchaseUrlModule(RobloxSubscriptionProductId, PaymentSessionId, ReferrerId),
			title = FStringBlackbirdWebviewHeaderName,
			closeCallback = function() --[[ Line: 81 ]]
				-- upvalues: GetResult (copy), CompleteRobloxSubscriptionUpsellFlowModule (upval)
				GetResult.setDidTryPurchasing(true)
				CompleteRobloxSubscriptionUpsellFlowModule()
			end,
			onOpenCallback = function() --[[ Line: 87 ]]
				-- upvalues: GetResult (copy), PromptStateModule (upval)
				GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseInProgress)
			end
		}):open()
		
		return
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseInProgress)
	local AppleAppStore: string = if Platform == Enum.Platform.IOS then "AppleAppStore" elseif Platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
	GetResult.setIsNativePurchase(true)
	local Success, _ = pcall(function() --[[ Line: 101 ]]
		-- upvalues: FFlagEnablePlusReferralLandingSheet (upval), EnableSubscriptionPurchaseReferrerIdEngineFeature (upval), ReferrerId (copy), MarketplaceService (upval), ConstantsModule (upval), RobloxSubscriptionProductId (copy), AppleAppStore (copy), PaymentSessionId (copy)
		if FFlagEnablePlusReferralLandingSheet and EnableSubscriptionPurchaseReferrerIdEngineFeature and ReferrerId then
			MarketplaceService:PerformSubscriptionPurchaseV3Async(ConstantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, RobloxSubscriptionProductId, AppleAppStore, PaymentSessionId, ReferrerId)
			
			return
		else
			MarketplaceService:PerformSubscriptionPurchaseV3Async(ConstantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, RobloxSubscriptionProductId, AppleAppStore, PaymentSessionId)
		end
	end)
	
	if not Success then
		TransitionToErrorModule(ErrorReasonModule.GenericError, "performRobloxSubscriptionPurchase")
		LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellPurchaseFailedCounter)
	end
end

return performRobloxSubscriptionPurchase