local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Enums.ErrorCodeEnum)
local _ = require(commercePurchaseApp.Store.Types)

return function(p0) --[[ line: 8 | named "selectErrorCode" ]]
	return p0.commercePurchaseState.errorCode
end