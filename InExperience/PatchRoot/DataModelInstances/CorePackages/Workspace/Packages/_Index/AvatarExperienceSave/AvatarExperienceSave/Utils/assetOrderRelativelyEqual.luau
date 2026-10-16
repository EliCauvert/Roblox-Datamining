local _ = require(script:FindFirstAncestor("AvatarExperienceSave").Context.AvatarSaveContext)

return function(p1, p2, p3): boolean --[[ Line: 17 | Named "assetOrderRelativeEqual" ]]
	local List = {}
	local EquippedAssets = p1.equipped.EquippedAssets
	local EquippedAssets1 = p2.equipped.EquippedAssets
	
	if EquippedAssets == nil and EquippedAssets1 == nil then
		return true
	end
	if EquippedAssets == nil or EquippedAssets1 == nil then
		return false
	end
	for AssetTypeId, equippedAsset in EquippedAssets do
		if p3[AssetTypeId] ~= nil then
			for ItemId, value in equippedAsset do
				if value.order ~= nil then
					table.insert(List, {
						itemId = ItemId,
						assetTypeId = AssetTypeId,
						order = value.order
					})
				end
			end
		end
	end
	local TryOnItems = p1.tryOn.OutfitTryOn.TryOnItems or {}
	for _, tryOnItem in TryOnItems do
		if p3[tryOnItem.itemSubType] ~= nil and tryOnItem.order ~= nil then
			table.insert(List, {
				itemId = tryOnItem.itemId,
				assetTypeId = tryOnItem.itemSubType,
				order = tryOnItem.order
			})
		end
	end
	table.sort(List, function(A, B): boolean --[[ Line: 61 ]]
		return A.order < B.order
	end)
	local Order = nil
	local Flag = nil
	
	for _, value1 in List do
		if Order == nil then
			Order = value1.order
		end
		if EquippedAssets1[value1.assetTypeId] == nil or EquippedAssets1[value1.assetTypeId][value1.itemId] == nil then
			Flag = false
			local TryOnItems1 = p2.tryOn.OutfitTryOn.TryOnItems or {}
			for _, tryOnItem1 in TryOnItems1 do
				if value1.itemId == tryOnItem1.itemId then
					if tryOnItem1.order == nil or tryOnItem1.order < Order then
						return false
					end
					Flag = true
					Order = tryOnItem1.order
					break
				end
			end
			if not Flag then
				return false
			end
		elseif EquippedAssets1[value1.assetTypeId][value1.itemId].order ~= nil and EquippedAssets1[value1.assetTypeId][value1.itemId].order >= Order then
			Order = EquippedAssets1[value1.assetTypeId][value1.itemId].order
			continue
		else
			return false
		end
	end
	return true
end