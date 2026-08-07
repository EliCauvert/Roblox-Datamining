local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(purchasePrompt.types)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetPostPurchaseActions).name] = function(_, p0) --[[ line: 14 ]]
		return p0.postPurchaseActions
	end
})