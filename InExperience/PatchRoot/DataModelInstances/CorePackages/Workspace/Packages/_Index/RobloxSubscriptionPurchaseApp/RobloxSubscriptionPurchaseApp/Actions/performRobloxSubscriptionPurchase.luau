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
local fStringBlackbirdWebviewHeaderName = game:DefineFastString("FStringBlackbirdWebviewHeaderName", "Black bird")

local function _(p0) --[[ line: 34 | named "getPaymentProviderForPlatform" ]]
	return if p0 == Enum.Platform.IOS then "AppleAppStore" elseif p0 == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
end

function performRobloxSubscriptionPurchase() --[[ line: 44 ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagEnableStudioMockPurchaseRobloxSubscriptionModule (ref), runService (ref), marketplaceService (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), userInputService (ref), promptStateModule (ref), webViewServiceWrapperModule (ref), getSubscriptionPurchaseUrlModule (ref), fStringBlackbirdWebviewHeaderName (ref), constantsModule (ref), transitionToErrorModule (ref), errorReasonModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref)
	local var18 = robloxSubscriptionStoreModule.get()
	local robloxSubscriptionProductId = var18.getRobloxSubscriptionProductId()
	local paymentSessionId = var18.getPaymentSessionId()
	
	if robloxSubscriptionProductId == nil then return end
	if fFlagEnableStudioMockPurchaseRobloxSubscriptionModule and runService:IsStudio() then
		marketplaceService:SignalMockPurchaseRobloxSubscription()
		var18.setDidTryPurchasing(true)
		completeRobloxSubscriptionUpsellFlowModule()
		
		return
	elseif fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseAttempted")
	end
	local platform = userInputService:GetPlatform()
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.Linux else true else true then
		var18.setIsNativePurchase(false)
		var18.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
		webViewServiceWrapperModule.new({
			url = getSubscriptionPurchaseUrlModule(robloxSubscriptionProductId, paymentSessionId),
			title = fStringBlackbirdWebviewHeaderName,
			closeCallback = function() --[[ line: 77 ]]
				-- upvalues: var18 (ref), completeRobloxSubscriptionUpsellFlowModule (copy)
				var18.setDidTryPurchasing(true)
				completeRobloxSubscriptionUpsellFlowModule()
			end,
			onOpenCallback = function() --[[ line: 83 ]]
				-- upvalues: var18 (ref), promptStateModule (copy)
				var18.setPromptState(promptStateModule.SubscriptionPurchaseInProgress)
			end
		}):open()
		
		return
	end
	var18.setPromptState(promptStateModule.SubscriptionPurchaseInProgress)
	local var22 = if platform == Enum.Platform.IOS then "AppleAppStore" elseif platform == Enum.Platform.Android then "GooglePlayStore" else "Unknown"
	var18.setIsNativePurchase(true)
	local ok, _ = pcall(function() --[[ line: 96 ]]
		-- upvalues: marketplaceService (copy), constantsModule (copy), robloxSubscriptionProductId (ref), var22 (ref), paymentSessionId (ref)
		marketplaceService:PerformSubscriptionPurchaseV3Async(constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, robloxSubscriptionProductId, var22, paymentSessionId)
	end)
	
	if not ok then
		transitionToErrorModule(errorReasonModule.GenericError, "performRobloxSubscriptionPurchase")
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellPurchaseFailedCounter)
	end
end

return performRobloxSubscriptionPurchase