local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.ErrorCodeEnum)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseFailed", function(p0, p1) --[[ line: 15 ]]
	return { errorCode = p0, errorMetadata = p1 }
end)