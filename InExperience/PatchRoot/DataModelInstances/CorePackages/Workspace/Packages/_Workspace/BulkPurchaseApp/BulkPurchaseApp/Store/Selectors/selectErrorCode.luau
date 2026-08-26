local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(bulkPurchaseApp.Store.Types)

return function(p1)
	return p1.errorCode
end