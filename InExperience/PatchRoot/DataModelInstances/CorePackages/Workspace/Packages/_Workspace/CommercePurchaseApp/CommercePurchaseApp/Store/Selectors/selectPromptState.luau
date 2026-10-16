local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(CommercePurchaseApp.Store.Types)
local _ = require(CommercePurchaseApp.Enums.CommercePurchasePromptStateEnum)

return function(p1) --[[ Line: 8 | Named "selectPromptState" ]]
	return p1.commercePurchaseState.promptState
end