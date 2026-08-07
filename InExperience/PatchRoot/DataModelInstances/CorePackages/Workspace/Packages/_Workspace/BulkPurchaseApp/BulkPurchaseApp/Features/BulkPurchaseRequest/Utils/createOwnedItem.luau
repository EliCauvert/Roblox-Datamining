local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestOwnedItem)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)

return function(p0) --[[ line: 10 | named "createOwnedItem" ]]
	-- upvalues: getThumbnailUrlModule (ref)
	return {
		id = p0.id,
		name = p0.name,
		image = getThumbnailUrlModule(p0.id, p0.type),
		ownedCount = p0.ownedCount
	}
end