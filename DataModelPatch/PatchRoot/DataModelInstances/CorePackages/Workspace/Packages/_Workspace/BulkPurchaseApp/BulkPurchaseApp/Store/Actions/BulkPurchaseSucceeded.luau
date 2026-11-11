local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return require(BulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseSucceeded", function(PromptState, ItemStatuses)
	return { promptState = PromptState, itemStatuses = ItemStatuses }
end)