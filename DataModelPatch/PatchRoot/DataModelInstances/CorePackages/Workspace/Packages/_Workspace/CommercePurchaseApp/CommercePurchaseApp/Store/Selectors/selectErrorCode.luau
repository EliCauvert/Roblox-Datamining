local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(CommercePurchaseApp.Enums.ErrorCodeEnum)
local _ = require(CommercePurchaseApp.Store.Types)

return function(p1)
	return p1.commercePurchaseState.errorCode
end