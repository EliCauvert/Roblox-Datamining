local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local roduxModule = require(bulkPurchaseApp.Parent.Rodux)
local _ = require(bulkPurchaseApp.Store.Types)
local fFlagAXAddOffersToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return roduxModule.makeActionCreator("BulkPurchaseRequested", function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagAXAddOffersToBulkPurchaseModule (ref)
	return {
		itemData = p1,
		balance = p3,
		totalCost = p4,
		orderRequest = p2,
		options = p5,
		discountInformation = p6,
		offerData = if fFlagAXAddOffersToBulkPurchaseModule then p7 else nil
	}
end)