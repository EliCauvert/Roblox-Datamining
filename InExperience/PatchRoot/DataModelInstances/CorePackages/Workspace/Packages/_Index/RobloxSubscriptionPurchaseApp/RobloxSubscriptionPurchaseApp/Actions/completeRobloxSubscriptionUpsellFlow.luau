local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local marketplaceService = game:GetService("MarketplaceService")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local fFlagFixSignalFinishedOnErrorModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagFixSignalFinishedOnError)
local enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished")

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), promptStateModule (ref), fFlagFixSignalFinishedOnErrorModule (ref), enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature (ref), marketplaceService (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local didTryPurchasing = var1.getDidTryPurchasing()
	local robloxSubscriptionProductId = var1.getRobloxSubscriptionProductId()
	local skipWaitingForPurchaseResult = var1.getPurchaseFlowOptions().skipWaitingForPurchaseResult
	local promptState = var1.getPromptState()
	
	if promptState == promptStateModule.Error or promptState == promptStateModule.SubscriptionStatusPolling then
		if promptState == promptStateModule.Error and fFlagFixSignalFinishedOnErrorModule and enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			marketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(robloxSubscriptionProductId, didTryPurchasing)
		end
		finalizeRobloxSubscriptionUpsellFlowModule(false)
		
		return
	else
		var1.setPromptState(promptStateModule.SubscriptionPurchaseCompleted)
		
		if enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			marketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(robloxSubscriptionProductId, didTryPurchasing)
		end
		if skipWaitingForPurchaseResult or not didTryPurchasing then
			finalizeRobloxSubscriptionUpsellFlowModule(false)
			
			return
		end
		var1.setPromptState(promptStateModule.SubscriptionStatusPolling)
	end
end