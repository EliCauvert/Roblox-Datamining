local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local ActionCreator = require(PurchasePrompt.Parent.Rodux).makeActionCreator(script.Name, function(Products, Selection, VirtualItemBadgeType)
	return {
		products = Products,
		selection = Selection,
		virtualItemBadgeType = VirtualItemBadgeType
	}
end)
local PromptNativeUpsellSuggestionsModule = {
	name = ActionCreator.name,
	__call = function(_, p1, p2, p3)
		-- upvalues: ActionCreator (copy)
		return ActionCreator(p1, p2, p3)
	end
}
setmetatable(PromptNativeUpsellSuggestionsModule, PromptNativeUpsellSuggestionsModule)

return PromptNativeUpsellSuggestionsModule