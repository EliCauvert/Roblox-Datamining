local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return require(BulkPurchaseApp.Parent.Rodux).makeActionCreator("BulkPurchaseRequested", function(ItemData, OrderRequest, Balance, TotalCost, Options, DiscountInformation, p1)
	-- upvalues: FFlagAXAddOffersToBulkPurchaseModule (copy)
	return {
		itemData = ItemData,
		balance = Balance,
		totalCost = TotalCost,
		orderRequest = OrderRequest,
		options = Options,
		discountInformation = DiscountInformation,
		offerData = if FFlagAXAddOffersToBulkPurchaseModule then p1 else nil
	}
end)