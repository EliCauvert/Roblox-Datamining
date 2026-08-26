local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.ErrorCodeEnum)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseFailed", function(p1, p2)
	return { errorCode = p1, errorMetadata = p2 }
end)