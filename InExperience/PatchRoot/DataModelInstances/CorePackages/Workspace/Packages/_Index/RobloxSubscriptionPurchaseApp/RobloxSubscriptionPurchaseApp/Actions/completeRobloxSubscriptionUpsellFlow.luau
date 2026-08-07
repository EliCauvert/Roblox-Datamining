local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local marketplaceService = game:GetService("MarketplaceService")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local fFlagFixSignalFinishedOnErrorModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagFixSignalFinishedOnError)
local enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished")

return function() --[[ line: 16 | named "completeRobloxSubscriptionUpsellFlow" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), promptStateModule (ref), fFlagFixSignalFinishedOnErrorModule (ref), enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature (ref), marketplaceService (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref)
	local var7 = robloxSubscriptionStoreModule.get()
	local didTryPurchasing = var7.getDidTryPurchasing()
	local robloxSubscriptionProductId = var7.getRobloxSubscriptionProductId()
	local skipWaitingForPurchaseResult = var7.getPurchaseFlowOptions().skipWaitingForPurchaseResult
	local promptState = var7.getPromptState()
	
	if promptState == promptStateModule.Error or promptState == promptStateModule.SubscriptionStatusPolling then
		if promptState == promptStateModule.Error and fFlagFixSignalFinishedOnErrorModule and enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			marketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(robloxSubscriptionProductId, didTryPurchasing)
		end
		finalizeRobloxSubscriptionUpsellFlowModule(false)
		
		return
	else
		var7.setPromptState(promptStateModule.SubscriptionPurchaseCompleted)
		
		if enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			marketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(robloxSubscriptionProductId, didTryPurchasing)
		end
		if skipWaitingForPurchaseResult or not didTryPurchasing then
			finalizeRobloxSubscriptionUpsellFlowModule(false)
			
			return
		end
		var7.setPromptState(promptStateModule.SubscriptionStatusPolling)
	end
end