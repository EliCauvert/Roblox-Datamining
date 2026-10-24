local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local _ = require(Parent.IAPExperience)
local config = { response = nil, isFetching = false, requestId = nil }

local function clear()
	-- upvalues: config (copy)
	return config
end

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(config, {
	[require(PurchasePrompt.Actions.SetCartPricingFetching).name] = function(p1, p2)
		return {
			isFetching = true,
			response = p1.response,
			requestId = p2.requestId
		}
	end,
	[require(PurchasePrompt.Actions.SetCartPricingResponse).name] = function(p1, p2)
		return {
			isFetching = false,
			response = p2.response,
			requestId = p1.requestId
		}
	end,
	[require(PurchasePrompt.Actions.SetCartPricingFetchFailed).name] = clear,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = clear,
	[require(PurchasePrompt.Actions.RequestAssetPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestBundlePurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestGamepassPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestProductPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestSubscriptionPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestAvatarCreationFeePurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestExperiencePurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestLookPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase).name] = clear,
	[require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase).name] = clear
}))