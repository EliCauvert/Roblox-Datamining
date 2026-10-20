local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestUnpurchasableItem)
local PurchasableStateToItemPurchaseStatusMapModule = require(BulkPurchaseApp.Enums.PurchasableStateToItemPurchaseStatusMap)
local GetThumbnailUrlModule = require(BulkPurchaseApp.Utils.getThumbnailUrl)

return function(p1)
	-- upvalues: GetThumbnailUrlModule (copy), PurchasableStateToItemPurchaseStatusMapModule (copy)
	return {
		id = p1.id,
		name = p1.name,
		image = GetThumbnailUrlModule(p1.id, p1.type),
		status = PurchasableStateToItemPurchaseStatusMapModule[p1.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
	}
end