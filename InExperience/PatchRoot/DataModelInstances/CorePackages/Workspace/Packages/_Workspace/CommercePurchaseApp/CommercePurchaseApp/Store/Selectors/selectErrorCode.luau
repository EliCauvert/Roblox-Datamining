local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Enums.ErrorCodeEnum)
local _ = require(commercePurchaseApp.Store.Types)

return function(p1)
	return p1.commercePurchaseState.errorCode
end