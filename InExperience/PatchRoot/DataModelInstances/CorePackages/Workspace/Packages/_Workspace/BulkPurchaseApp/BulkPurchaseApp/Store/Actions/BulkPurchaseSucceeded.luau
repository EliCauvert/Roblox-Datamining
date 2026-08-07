local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseSucceeded", function(p0, p1) --[[ line: 15 ]]
	return { promptState = p0, itemStatuses = p1 }
end)