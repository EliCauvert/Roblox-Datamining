local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)

return function(p1) --[[ Line: 9 | Named "selectPromptState" ]]
	return p1.promptState
end