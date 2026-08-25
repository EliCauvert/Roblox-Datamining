local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(bulkPurchaseApp.Store.Types)

return function(p0)
	return p0.errorCode
end