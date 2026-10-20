local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestOwnedItem)
local GetThumbnailUrlModule = require(BulkPurchaseApp.Utils.getThumbnailUrl)

return function(p1)
	-- upvalues: GetThumbnailUrlModule (copy)
	return {
		id = p1.id,
		name = p1.name,
		image = GetThumbnailUrlModule(p1.id, p1.type),
		ownedCount = p1.ownedCount
	}
end