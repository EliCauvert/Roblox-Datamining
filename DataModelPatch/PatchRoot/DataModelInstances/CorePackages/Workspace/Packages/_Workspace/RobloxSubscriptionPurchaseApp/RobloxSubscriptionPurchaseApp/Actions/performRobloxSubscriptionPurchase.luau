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
local FStringBlackbirdWebviewHeaderName = game:DefineFastString("FStringBlackbirdWebviewHeaderName", "Black bird")

local function _(Platform): string
	return if Platform == Enum.Platform.IOS then "AppleAppStore" elseif Platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
end

function performRobloxSubscriptionPurchase()
	-- upvalues: RobloxSubscriptionStoreModule (copy), FFlagEnableStudioMockPurchaseRobloxSubscriptionModule (copy), RunService (copy), MarketplaceService (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), UserInputService (copy), PromptStateModule (copy), WebViewServiceWrapperModule (copy), GetSubscriptionPurchaseUrlModule (copy), FStringBlackbirdWebviewHeaderName (copy), ConstantsModule (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy)
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
	
	if Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux) then
		GetResult.setIsNativePurchase(false)
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
		WebViewServiceWrapperModule.new({
			url = GetSubscriptionPurchaseUrlModule(RobloxSubscriptionProductId, PaymentSessionId),
			title = FStringBlackbirdWebviewHeaderName,
			closeCallback = function()
				-- upvalues: GetResult (copy), CompleteRobloxSubscriptionUpsellFlowModule (upval)
				GetResult.setDidTryPurchasing(true)
				CompleteRobloxSubscriptionUpsellFlowModule()
			end,
			onOpenCallback = function()
				-- upvalues: GetResult (copy), PromptStateModule (upval)
				GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseInProgress)
			end
		}):open()
		
		return
	end
	GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseInProgress)
	local AppleAppStore: string = if Platform == Enum.Platform.IOS then "AppleAppStore" elseif Platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
	GetResult.setIsNativePurchase(true)
	local Success, _ = pcall(function()
		-- upvalues: MarketplaceService (upval), ConstantsModule (upval), RobloxSubscriptionProductId (copy), AppleAppStore (copy), PaymentSessionId (copy)
		MarketplaceService:PerformSubscriptionPurchaseV3Async(ConstantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, RobloxSubscriptionProductId, AppleAppStore, PaymentSessionId)
	end)
	
	if not Success then
		TransitionToErrorModule(ErrorReasonModule.GenericError, "performRobloxSubscriptionPurchase")
		LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellPurchaseFailedCounter)
	end
end

return performRobloxSubscriptionPurchase