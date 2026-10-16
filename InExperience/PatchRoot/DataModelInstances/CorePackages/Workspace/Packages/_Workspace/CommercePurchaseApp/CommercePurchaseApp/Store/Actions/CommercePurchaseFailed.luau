local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local _ = require(CommercePurchaseApp.Enums.ErrorCodeEnum)

return require(CommercePurchaseApp.Parent.Rodux).makeActionCreator("CommercePurchaseFailed", function(ErrorCode) --[[ Line: 12 ]]
	return { errorCode = ErrorCode }
end)