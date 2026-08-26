local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseRequested", function(p1, p2, p3, p4, p5, p6)
	return {
		itemData = p1,
		balance = p3,
		totalCost = p4,
		orderRequest = p2,
		options = p5,
		discountInformation = p6
	}
end)