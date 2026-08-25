local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p0)
	local var0 = 0
	
	if p0.itemData and p0.itemStatuses then
		for i, v in p0.itemData do
			if p0.itemStatuses[v.id] == Enum.MarketplaceItemPurchaseStatus.Success then
				var0 += v.priceRobux
			end
		end
	end
	return var0
end