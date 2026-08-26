local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return function(p1)
	return p1.promptState
end