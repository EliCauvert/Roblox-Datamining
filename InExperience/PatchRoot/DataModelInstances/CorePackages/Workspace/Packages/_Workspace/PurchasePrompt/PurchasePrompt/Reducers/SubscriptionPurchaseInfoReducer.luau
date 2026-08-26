local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local getPreviewImageUrlModule = require(purchasePrompt.getPreviewImageUrl)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SubscriptionPurchaseInfoReceived).name] = function(_, p1)
		-- upvalues: getPreviewImageUrlModule (ref)
		p1.subscriptionPurchaseInfo.ImageUrl = getPreviewImageUrlModule(p1.subscriptionPurchaseInfo)
		
		return p1.subscriptionPurchaseInfo
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})