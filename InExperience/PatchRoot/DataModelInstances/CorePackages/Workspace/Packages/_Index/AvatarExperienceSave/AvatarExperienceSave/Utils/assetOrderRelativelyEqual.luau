local _ = require(script:FindFirstAncestor("AvatarExperienceSave").Context.AvatarSaveContext)

return function(value, p0, p1)
	local t = {}
	local equippedAssets = value.equipped.EquippedAssets
	local equippedAssets_1 = p0.equipped.EquippedAssets
	
	if equippedAssets == nil and equippedAssets_1 == nil then
		return true
	elseif equippedAssets == nil or equippedAssets_1 == nil then
		return false
	end
	for i, v in equippedAssets do
		if p1[i] ~= nil then
			for i_1, v_1 in v do
				if v_1.order ~= nil then
					table.insert(t, { itemId = i_1, assetTypeId = i, order = v_1.order })
				end
			end
		end
	end
	for i_1, v_1 in value.tryOn.OutfitTryOn.TryOnItems or {} do
		if p1[v_1.itemSubType] ~= nil and v_1.order ~= nil then
			table.insert(t, {
				itemId = v_1.itemId,
				assetTypeId = v_1.itemSubType,
				order = v_1.order
			})
		end
	end
	local var1
	table.sort(t, function(p2, p3)
		return p2.order < p3.order
	end)
	local order = nil
	
	for i_2, v_2 in t do
		if order == nil then
			order = v_2.order
		end
		if equippedAssets_1[v_2.assetTypeId] == nil or equippedAssets_1[v_2.assetTypeId][v_2.itemId] == nil then
			var1 = false
			
			for i_3, v_3 in p0.tryOn.OutfitTryOn.TryOnItems or {} do
				if v_2.itemId == v_3.itemId then
					if v_3.order ~= nil and v_3.order >= order then
						var1 = true
						order = v_3.order
						break
					end
					return false
				end
			end
			if not var1 then
				return false
			end
		elseif equippedAssets_1[v_2.assetTypeId][v_2.itemId].order ~= nil and equippedAssets_1[v_2.assetTypeId][v_2.itemId].order >= order then
			order = equippedAssets_1[v_2.assetTypeId][v_2.itemId].order
			continue
		end
		return false
	end
	return true
end