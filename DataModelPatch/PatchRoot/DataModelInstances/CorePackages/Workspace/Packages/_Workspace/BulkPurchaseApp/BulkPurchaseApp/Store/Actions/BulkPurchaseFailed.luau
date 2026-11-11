local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Enums.ErrorCodeEnum)

return require(BulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseFailed", function(ErrorCode, ErrorMetadata)
	return { errorCode = ErrorCode, errorMetadata = ErrorMetadata }
end)