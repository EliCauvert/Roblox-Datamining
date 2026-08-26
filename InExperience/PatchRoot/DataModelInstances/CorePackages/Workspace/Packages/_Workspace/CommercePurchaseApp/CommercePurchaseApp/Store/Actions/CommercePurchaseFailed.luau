local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Enums.ErrorCodeEnum)

return require(commercePurchaseApp.Parent.Rodux).makeActionCreator("CommercePurchaseFailed", function(p1)
	return { errorCode = p1 }
end)