local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p1)
	local var1 = 0
	
	if p1.itemData and p1.itemStatuses then
		for i, v in p1.itemData do
			if p1.itemStatuses[v.id] == Enum.MarketplaceItemPurchaseStatus.Success then
				var1 += v.priceRobux
			end
		end
	end
	return var1
end