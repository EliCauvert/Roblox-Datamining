local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

local function _(p1)
	return if p1 == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset
end

return function(p1)
	local t = {}
	
	if p1.itemData then
		for i, v in p1.itemData do
			table.insert(t, {
				id = v.id,
				type = if v.type == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset,
				status = if p1.itemStatuses then p1.itemStatuses[v.id] or Enum.MarketplaceItemPurchaseStatus.SystemError else Enum.MarketplaceItemPurchaseStatus.SystemError
			})
		end
	end
	return t
end