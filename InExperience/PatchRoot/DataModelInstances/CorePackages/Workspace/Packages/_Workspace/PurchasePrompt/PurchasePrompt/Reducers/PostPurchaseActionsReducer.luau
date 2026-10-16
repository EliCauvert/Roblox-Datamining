local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.types)

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetPostPurchaseActions).name] = function(_, p1) --[[ Line: 14 ]]
		return p1.postPurchaseActions
	end
}))