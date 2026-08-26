local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestUnpurchasableItem)
local purchasableStateToItemPurchaseStatusMapModule = require(bulkPurchaseApp.Enums.PurchasableStateToItemPurchaseStatusMap)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)

return function(p1)
	-- upvalues: getThumbnailUrlModule (ref), purchasableStateToItemPurchaseStatusMapModule (ref)
	return {
		id = p1.id,
		name = p1.name,
		image = getThumbnailUrlModule(p1.id, p1.type),
		status = purchasableStateToItemPurchaseStatusMapModule[p1.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
	}
end