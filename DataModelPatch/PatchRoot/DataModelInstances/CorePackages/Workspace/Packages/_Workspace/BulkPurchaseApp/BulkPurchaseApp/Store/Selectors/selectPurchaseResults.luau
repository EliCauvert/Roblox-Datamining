local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local SelectRobuxSpentModule = require(BulkPurchaseApp.Store.Selectors.selectRobuxSpent)
local SelectResultItemsModule = require(BulkPurchaseApp.Store.Selectors.selectResultItems)
local _ = require(BulkPurchaseApp.Store.Types)

return function(p1)
	-- upvalues: SelectRobuxSpentModule (copy), SelectResultItemsModule (copy)
	return {
		RobuxSpent = SelectRobuxSpentModule(p1),
		Items = SelectResultItemsModule(p1)
	}
end