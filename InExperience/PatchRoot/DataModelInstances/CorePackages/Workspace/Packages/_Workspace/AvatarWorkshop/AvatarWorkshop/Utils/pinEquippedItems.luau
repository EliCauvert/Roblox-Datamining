local _ = require(script:FindFirstAncestor("AvatarWorkshop").Parent.DataHydration.AvatarInventory)

return function(List, ItemIds)
	local Buffer = table.create(#ItemIds + #List)
	local t = {}
	
	for _, itemId in ItemIds do
		if not t[itemId] then
			t[itemId] = true
			table.insert(Buffer, { itemType = "Asset", itemId = itemId })
		end
	end
	for _, value in List do
		if value.itemType ~= "Asset" or not t[value.itemId] then
			table.insert(Buffer, value)
		end
	end
	return Buffer
end