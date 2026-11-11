local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(BulkPurchaseApp.Store.Types)

return function(p1)
	return p1.errorCode
end