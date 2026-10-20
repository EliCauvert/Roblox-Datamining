local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)

return require(BulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseRequested", function(ItemData, OrderRequest, Balance, TotalCost, Options, DiscountInformation)
	return {
		itemData = ItemData,
		balance = Balance,
		totalCost = TotalCost,
		orderRequest = OrderRequest,
		options = Options,
		discountInformation = DiscountInformation
	}
end)