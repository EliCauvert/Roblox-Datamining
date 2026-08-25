local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)

return require(bulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseRequested", function(p0, p1, p2, p3, p4, p5)
	return {
		itemData = p0,
		balance = p2,
		totalCost = p3,
		orderRequest = p1,
		options = p4,
		discountInformation = p5
	}
end)