local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(BulkPurchaseApp.Store.Types)

return function(p1) --[[ Line: 8 | Named "selectErrorCode" ]]
	return p1.errorCode
end