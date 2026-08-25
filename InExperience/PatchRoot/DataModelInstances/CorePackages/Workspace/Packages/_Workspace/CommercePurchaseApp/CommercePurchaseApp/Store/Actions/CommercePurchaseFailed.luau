local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(commercePurchaseApp.Enums.ErrorCodeEnum)

return require(commercePurchaseApp.Parent.Rodux).makeActionCreator("CommercePurchaseFailed", function(p0)
	return { errorCode = p0 }
end)