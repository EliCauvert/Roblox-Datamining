local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return function(p0)
	return p0.promptState
end