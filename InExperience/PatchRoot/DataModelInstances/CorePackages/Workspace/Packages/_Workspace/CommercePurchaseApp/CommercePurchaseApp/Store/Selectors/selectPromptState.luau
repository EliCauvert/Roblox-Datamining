local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Store.Types)
local _ = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)

return function(p0)
	return p0.commercePurchaseState.promptState
end