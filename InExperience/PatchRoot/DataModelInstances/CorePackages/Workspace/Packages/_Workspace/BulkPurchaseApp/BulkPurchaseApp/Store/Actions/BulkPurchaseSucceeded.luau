local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseSucceeded", function(p1, p2)
	return { promptState = p1, itemStatuses = p2 }
end)