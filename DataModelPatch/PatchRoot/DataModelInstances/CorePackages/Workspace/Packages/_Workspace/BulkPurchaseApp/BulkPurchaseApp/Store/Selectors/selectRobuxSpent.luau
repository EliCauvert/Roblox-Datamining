local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p1): number
	local NewPriceRobux = 0
	
	if p1.itemData and p1.itemStatuses then
		for _, value in p1.itemData do
			if p1.itemStatuses[value.id] == Enum.MarketplaceItemPurchaseStatus.Success then
				NewPriceRobux += value.priceRobux
			end
		end
	end
	return NewPriceRobux
end