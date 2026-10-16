local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Enums.ErrorCodeEnum)

return require(BulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseFailed", function(ErrorCode, ErrorMetadata) --[[ Line: 15 ]]
	return { errorCode = ErrorCode, errorMetadata = ErrorMetadata }
end)