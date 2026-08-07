local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestUnpurchasableItem)
local purchasableStateToItemPurchaseStatusMapModule = require(bulkPurchaseApp.Enums.PurchasableStateToItemPurchaseStatusMap)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)

return function(p0) --[[ line: 11 | named "createUnpurchasableItem" ]]
	-- upvalues: getThumbnailUrlModule (ref), purchasableStateToItemPurchaseStatusMapModule (ref)
	return {
		id = p0.id,
		name = p0.name,
		image = getThumbnailUrlModule(p0.id, p0.type),
		status = purchasableStateToItemPurchaseStatusMapModule[p0.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
	}
end