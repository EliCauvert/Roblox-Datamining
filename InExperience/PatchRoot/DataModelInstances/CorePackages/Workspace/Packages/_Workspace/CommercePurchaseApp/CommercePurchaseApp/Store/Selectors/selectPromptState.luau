local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Store.Types)
local _ = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)

return function(p1)
	return p1.commercePurchaseState.promptState
end