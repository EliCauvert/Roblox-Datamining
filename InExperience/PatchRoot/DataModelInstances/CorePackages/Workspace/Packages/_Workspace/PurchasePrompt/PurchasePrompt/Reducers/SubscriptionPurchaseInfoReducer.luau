local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local getPreviewImageUrlModule = require(purchasePrompt.getPreviewImageUrl)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SubscriptionPurchaseInfoReceived).name] = function(_, p0) --[[ line: 12 ]]
		-- upvalues: getPreviewImageUrlModule (ref)
		p0.subscriptionPurchaseInfo.ImageUrl = getPreviewImageUrlModule(p0.subscriptionPurchaseInfo)
		
		return p0.subscriptionPurchaseInfo
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 16 ]]
		return {}
	end
})