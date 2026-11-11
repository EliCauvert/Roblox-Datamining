local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return function(p1)
	return p1.promptState
end