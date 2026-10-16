local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local GetPreviewImageUrlModule = require(PurchasePrompt.getPreviewImageUrl)

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SubscriptionPurchaseInfoReceived).name] = function(_, p1) --[[ Line: 12 ]]
		-- upvalues: GetPreviewImageUrlModule (copy)
		p1.subscriptionPurchaseInfo.ImageUrl = GetPreviewImageUrlModule(p1.subscriptionPurchaseInfo)
		
		return p1.subscriptionPurchaseInfo
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ Line: 16 ]]
		return {}
	end
}))