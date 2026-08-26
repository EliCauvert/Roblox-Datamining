local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestOwnedItem)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)

return function(p1)
	-- upvalues: getThumbnailUrlModule (ref)
	return {
		id = p1.id,
		name = p1.name,
		image = getThumbnailUrlModule(p1.id, p1.type),
		ownedCount = p1.ownedCount
	}
end