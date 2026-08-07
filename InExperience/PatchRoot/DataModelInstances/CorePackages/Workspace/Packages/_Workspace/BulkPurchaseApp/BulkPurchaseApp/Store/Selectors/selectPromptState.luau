local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return function(p0) --[[ line: 9 | named "selectPromptState" ]]
	return p0.promptState
end