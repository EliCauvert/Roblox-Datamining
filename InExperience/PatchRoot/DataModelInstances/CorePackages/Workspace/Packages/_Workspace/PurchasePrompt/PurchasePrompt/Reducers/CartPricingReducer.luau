local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Rodux = require(Parent.PurchasePromptDeps).Rodux
local _ = require(Parent.IAPExperience)
local SetCartPricingResponseModule = require(PurchasePrompt.Actions.SetCartPricingResponse)
local SetCartPricingFetchingModule = require(PurchasePrompt.Actions.SetCartPricingFetching)
local SetCartPricingFetchFailedModule = require(PurchasePrompt.Actions.SetCartPricingFetchFailed)
local CompleteRequestModule = require(PurchasePrompt.Actions.CompleteRequest)
local RequestAssetPurchaseModule = require(PurchasePrompt.Actions.RequestAssetPurchase)
local RequestBundlePurchaseModule = require(PurchasePrompt.Actions.RequestBundlePurchase)
local RequestGamepassPurchaseModule = require(PurchasePrompt.Actions.RequestGamepassPurchase)
local RequestProductPurchaseModule = require(PurchasePrompt.Actions.RequestProductPurchase)
local RequestSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestSubscriptionPurchase)
local RequestAvatarCreationFeePurchaseModule = require(PurchasePrompt.Actions.RequestAvatarCreationFeePurchase)
local RequestExperiencePurchaseModule = require(PurchasePrompt.Actions.RequestExperiencePurchase)
local RequestLookPurchaseModule = require(PurchasePrompt.Actions.RequestLookPurchase)
local RequestRobuxUpsellPurchaseModule = require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase)
local RequestDeveloperSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local config = { response = nil, isFetching = false, requestId = nil }

local function clear()
	-- upvalues: config (copy)
	return config
end

return (Rodux.createReducer(config, {
	[SetCartPricingFetchingModule.name] = function(p1, p2)
		return {
			isFetching = true,
			response = p1.response,
			requestId = p2.requestId
		}
	end,
	[SetCartPricingResponseModule.name] = function(p1, p2)
		return {
			isFetching = false,
			response = p2.response,
			requestId = p1.requestId
		}
	end,
	[SetCartPricingFetchFailedModule.name] = clear,
	[CompleteRequestModule.name] = clear,
	[RequestAssetPurchaseModule.name] = clear,
	[RequestBundlePurchaseModule.name] = clear,
	[RequestGamepassPurchaseModule.name] = clear,
	[RequestProductPurchaseModule.name] = clear,
	[RequestSubscriptionPurchaseModule.name] = clear,
	[RequestAvatarCreationFeePurchaseModule.name] = clear,
	[RequestExperiencePurchaseModule.name] = clear,
	[RequestLookPurchaseModule.name] = clear,
	[RequestRobuxUpsellPurchaseModule.name] = clear,
	[RequestDeveloperSubscriptionPurchaseModule.name] = clear
}))