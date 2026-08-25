local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local selectRobuxSpentModule = require(bulkPurchaseApp.Store.Selectors.selectRobuxSpent)
local selectResultItemsModule = require(bulkPurchaseApp.Store.Selectors.selectResultItems)
local _ = require(bulkPurchaseApp.Store.Types)

return function(p0)
	-- upvalues: selectRobuxSpentModule (ref), selectResultItemsModule (ref)
	return {
		RobuxSpent = selectRobuxSpentModule(p0),
		Items = selectResultItemsModule(p0)
	}
end