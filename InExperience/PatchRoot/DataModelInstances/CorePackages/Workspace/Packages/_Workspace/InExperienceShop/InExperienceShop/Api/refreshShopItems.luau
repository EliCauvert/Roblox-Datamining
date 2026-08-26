local _ = require(script:FindFirstAncestor("InExperienceShop").Types)
local _ = require(script.Parent.multiGetProductInfo)
local shopItemMappingModule = require(script.Parent.shopItemMapping)
local makeRequestKey = shopItemMappingModule.makeRequestKey
local toShopItem = shopItemMappingModule.toShopItem

local function refreshShopItemFromProductInfo(p1, p2)
	-- upvalues: toShopItem (ref)
	local var1 = toShopItem(p2, p1.itemType, tonumber(p1.id))
	
	return {
		id = p1.id,
		itemType = p1.itemType,
		isOwned = p1.isOwned,
		creator = var1.creator or p1.creator,
		universeId = p1.universeId,
		originalIndex = p1.originalIndex,
		name = var1.name,
		thumbnail = var1.thumbnail,
		price = var1.price,
		userBasePriceInRobux = var1.userBasePriceInRobux,
		description = var1.description,
		updated = var1.updated
	}
end

return {
	infoTypeForShopItemType = function(p1)
		return if p1 == "Product" then Enum.InfoType.Product elseif p1 == "GamePass" then Enum.InfoType.GamePass else nil
	end,
	buildRequestsFromSections = function(p1)
		-- upvalues: makeRequestKey (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p1) do
			for i_1, v_1 in ipairs(v.items) do
				local itemType = v_1.itemType
				local var1 = if itemType == "Product" then Enum.InfoType.Product elseif itemType == "GamePass" then Enum.InfoType.GamePass else nil
				
				if var1 ~= nil then
					local var2 = tonumber(v_1.id)
					
					if var2 ~= nil then
						local var3 = makeRequestKey(var2, var1)
						
						if not t_1[var3] then
							t_1[var3] = true
							table.insert(t, { id = var2, infoType = var1 })
						end
					end
				end
			end
		end
		return t
	end,
	appendFailedItemRequests = function(p2, p3)
		-- upvalues: makeRequestKey (ref)
		local t = {}
		
		for i, v in ipairs(p2) do
			t[makeRequestKey(v.id, v.infoType)] = true
		end
		for i, v_1 in ipairs(p3) do
			local var4 = makeRequestKey(v_1.id, v_1.infoType)
			
			if not t[var4] then
				t[var4] = true
				table.insert(p2, { id = v_1.id, infoType = v_1.infoType })
			end
		end
		return p2
	end,
	refreshShopItemFromProductInfo = refreshShopItemFromProductInfo,
	mergeProductInfoIntoSections = function(p4, p5)
		-- upvalues: makeRequestKey (ref), refreshShopItemFromProductInfo (ref)
		local t = {}
		
		for i, v in ipairs(p5) do
			t[makeRequestKey(v.request.id, v.request.infoType)] = v
		end
		local list = table.create(#p4)
		
		for i_1, v_1 in ipairs(p4) do
			local list_1 = nil
			
			for i_2, v_2 in ipairs(v_1.items) do
				local itemType = v_2.itemType
				local var5 = if itemType == "Product" then Enum.InfoType.Product elseif itemType == "GamePass" then Enum.InfoType.GamePass else nil
				local var6 = tonumber(v_2.id)
				local var7 = if not (var5 == nil or var6 == nil) then t[makeRequestKey(var6, var5)] else nil
				
				if var7 ~= nil and var7.ok then
					if list_1 == nil then
						list_1 = table.create(#v_1.items)
						
						for i_3 = 1, i_2 - 1 do
							list_1[i_3] = v_1.items[i_3]
						end
					end
					list_1[i_2] = refreshShopItemFromProductInfo(v_2, var7.value)
				elseif list_1 ~= nil then
					list_1[i_2] = v_2
				end
			end
			if list_1 == nil then
				list[i_1] = v_1
			else
				list[i_1] = {
					id = v_1.id,
					name = v_1.name,
					items = list_1,
					paymentSessionId = v_1.paymentSessionId,
					robuxPackages = v_1.robuxPackages
				}
			end
		end
		return list
	end,
	insertRecoveredItemsIntoSections = function(p6, p7, p8)
		-- upvalues: makeRequestKey (ref), toShopItem (ref)
		local t = {}
		
		for i, v in ipairs(p7) do
			t[makeRequestKey(v.request.id, v.request.infoType)] = v
		end
		local v_2
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in ipairs(p8) do
			v_2 = t[makeRequestKey(v_1.id, v_1.infoType)]
			
			if v_2 == nil or not v_2.ok then
				table.insert(t_2, v_1)
			else
				local sectionId = t_1[v_1.sectionId]
				
				if sectionId == nil then
					sectionId = {}
					t_1[v_1.sectionId] = sectionId
				end
				local var8 = toShopItem(v_2.value, v_1.itemType, v_1.id)
				var8.originalIndex = v_1.originalIndex
				table.insert(sectionId, var8)
			end
		end
		local list = table.create(#p6)
		
		for i_2, v_2 in ipairs(p6) do
			local id = t_1[v_2.id]
			
			if id == nil then
				list[i_2] = v_2
				continue
			end
			table.sort(id, function(p9, p10)
				return (p9.originalIndex or 0) < (p10.originalIndex or 0)
			end)
			local list_1 = table.create(#v_2.items + #id)
			local var9 = 1
			local var10 = 1
			while var9 <= #v_2.items or var10 <= #id do
				local var11 = v_2.items[var9]
				local var12 = id[var10]
				
				if var12 == nil then
					table.insert(list_1, var11)
					var9 += 1
				elseif var11 == nil then
					table.insert(list_1, var12)
					var10 += 1
				elseif (var11.originalIndex or 0) <= (var12.originalIndex or 0) then
					table.insert(list_1, var11)
					var9 += 1
				else
					table.insert(list_1, var12)
					var10 += 1
				end
			end
			list[i_2] = {
				id = v_2.id,
				name = v_2.name,
				items = list_1,
				paymentSessionId = v_2.paymentSessionId,
				robuxPackages = v_2.robuxPackages
			}
			continue
		end
		return list, t_2
	end
}