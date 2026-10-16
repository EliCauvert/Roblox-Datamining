local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local MarketplaceService = game:GetService("MarketplaceService")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local FFlagFixSignalFinishedOnErrorModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagFixSignalFinishedOnError)
local EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished")

return function() --[[ Line: 16 | Named "completeRobloxSubscriptionUpsellFlow" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), PromptStateModule (copy), FFlagFixSignalFinishedOnErrorModule (copy), EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature (copy), MarketplaceService (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local DidTryPurchasing = GetResult.getDidTryPurchasing()
	local RobloxSubscriptionProductId = GetResult.getRobloxSubscriptionProductId()
	local SkipWaitingForPurchaseResult = GetResult.getPurchaseFlowOptions().skipWaitingForPurchaseResult
	local PromptState = GetResult.getPromptState()
	
	if PromptState == PromptStateModule.Error or PromptState == PromptStateModule.SubscriptionStatusPolling then
		if PromptState == PromptStateModule.Error and FFlagFixSignalFinishedOnErrorModule and EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			MarketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(RobloxSubscriptionProductId, DidTryPurchasing)
		end
		FinalizeRobloxSubscriptionUpsellFlowModule(false)
		
		return
	else
		GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseCompleted)
		
		if EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then
			MarketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(RobloxSubscriptionProductId, DidTryPurchasing)
		end
		if SkipWaitingForPurchaseResult or not DidTryPurchasing then
			FinalizeRobloxSubscriptionUpsellFlowModule(false)
			
			return
		else
			GetResult.setPromptState(PromptStateModule.SubscriptionStatusPolling)
		end
	end
end