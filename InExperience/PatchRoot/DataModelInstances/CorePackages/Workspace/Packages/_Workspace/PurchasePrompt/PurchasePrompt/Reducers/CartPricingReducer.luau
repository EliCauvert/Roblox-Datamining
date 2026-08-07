local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local rodux = require(parent.PurchasePromptDeps).Rodux
local _ = require(parent.IAPExperience)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local requestAssetPurchaseModule = require(purchasePrompt.Actions.RequestAssetPurchase)
local requestBundlePurchaseModule = require(purchasePrompt.Actions.RequestBundlePurchase)
local requestGamepassPurchaseModule = require(purchasePrompt.Actions.RequestGamepassPurchase)
local requestProductPurchaseModule = require(purchasePrompt.Actions.RequestProductPurchase)
local requestPremiumPurchaseModule = require(purchasePrompt.Actions.RequestPremiumPurchase)
local requestSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestSubscriptionPurchase)
local requestAvatarCreationFeePurchaseModule = require(purchasePrompt.Actions.RequestAvatarCreationFeePurchase)
local requestExperiencePurchaseModule = require(purchasePrompt.Actions.RequestExperiencePurchase)
local requestLookPurchaseModule = require(purchasePrompt.Actions.RequestLookPurchase)
local requestRobuxUpsellPurchaseModule = require(purchasePrompt.Actions.RequestRobuxUpsellPurchase)
local requestDeveloperSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local t = { response = nil, isFetching = false, requestId = nil }

local function clear() --[[ line: 52 ]]
	-- upvalues: t (ref)
	return t
end

return rodux.createReducer(t, {
	[setCartPricingFetchingModule.name] = function(p0, p1) --[[ line: 57 ]]
		return {
			isFetching = true,
			response = p0.response,
			requestId = p1.requestId
		}
	end,
	[setCartPricingResponseModule.name] = function(p2, p3) --[[ line: 60 ]]
		return {
			isFetching = false,
			response = p3.response,
			requestId = p2.requestId
		}
	end,
	[setCartPricingFetchFailedModule.name] = clear,
	[completeRequestModule.name] = clear,
	[requestAssetPurchaseModule.name] = clear,
	[requestBundlePurchaseModule.name] = clear,
	[requestGamepassPurchaseModule.name] = clear,
	[requestProductPurchaseModule.name] = clear,
	[requestPremiumPurchaseModule.name] = clear,
	[requestSubscriptionPurchaseModule.name] = clear,
	[requestAvatarCreationFeePurchaseModule.name] = clear,
	[requestExperiencePurchaseModule.name] = clear,
	[requestLookPurchaseModule.name] = clear,
	[requestRobuxUpsellPurchaseModule.name] = clear,
	[requestDeveloperSubscriptionPurchaseModule.name] = clear
})