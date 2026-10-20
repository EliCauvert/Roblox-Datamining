local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

local function _(p1)
	return if p1 == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset
end

return function(p1)
	local List = {}
	
	if p1.itemData then
		for _, value in p1.itemData do
			table.insert(List, {
				id = value.id,
				type = if value.type == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset,
				status = p1.itemStatuses and p1.itemStatuses[value.id] or Enum.MarketplaceItemPurchaseStatus.SystemError
			})
		end
	end
	return List
end