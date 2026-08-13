local _ = require(script:FindFirstAncestor("InExperienceShop").Types)
local _ = require(script.Parent.multiGetProductInfo)
local shopItemMappingModule = require(script.Parent.shopItemMapping)
local makeRequestKey = shopItemMappingModule.makeRequestKey
local toShopItem = shopItemMappingModule.toShopItem

local function refreshShopItemFromProductInfo(p0, p1) --[[ line: 200 ]]
	-- upvalues: toShopItem (ref)
	local var2 = toShopItem(p1, p0.itemType, tonumber(p0.id))
	
	return {
		id = p0.id,
		itemType = p0.itemType,
		isOwned = p0.isOwned,
		creator = var2.creator or p0.creator,
		universeId = p0.universeId,
		originalIndex = p0.originalIndex,
		name = var2.name,
		thumbnail = var2.thumbnail,
		price = var2.price,
		userBasePriceInRobux = var2.userBasePriceInRobux,
		description = var2.description,
		updated = var2.updated
	}
end

return {
	infoTypeForShopItemType = function(p2) --[[ line: 26 ]]
		return if p2 == "Product" then Enum.InfoType.Product elseif p2 == "GamePass" then Enum.InfoType.GamePass else nil
	end,
	buildRequestsFromSections = function(p3) --[[ line: 39 ]]
		-- upvalues: makeRequestKey (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p3) do
			for i_1, v_1 in ipairs(v.items) do
				local itemType = v_1.itemType
				local var5 = if itemType == "Product" then Enum.InfoType.Product elseif itemType == "GamePass" then Enum.InfoType.GamePass else nil
				
				if var5 ~= nil then
					local var6 = tonumber(v_1.id)
					
					if var6 ~= nil then
						local var7 = makeRequestKey(var6, var5)
						
						if not t_1[var7] then
							t_1[var7] = true
							table.insert(t, { id = var6, infoType = var5 })
						end
					end
				end
			end
		end
		return t
	end,
	appendFailedItemRequests = function(p4, p5) --[[ line: 66 ]]
		-- upvalues: makeRequestKey (ref)
		local t = {}
		
		for i, v in ipairs(p4) do
			t[makeRequestKey(v.id, v.infoType)] = true
		end
		for i, v_1 in ipairs(p5) do
			local var9 = makeRequestKey(v_1.id, v_1.infoType)
			
			if not t[var9] then
				t[var9] = true
				table.insert(p4, { id = v_1.id, infoType = v_1.infoType })
			end
		end
		return p4
	end,
	refreshShopItemFromProductInfo = refreshShopItemFromProductInfo,
	mergeProductInfoIntoSections = function(p6, p7) --[[ line: 231 ]]
		-- upvalues: makeRequestKey (ref), refreshShopItemFromProductInfo (ref)
		local t = {}
		
		for i, v in ipairs(p7) do
			t[makeRequestKey(v.request.id, v.request.infoType)] = v
		end
		local list = table.create(#p6)
		
		for i_1, v_1 in ipairs(p6) do
			local list_1 = nil
			
			for i_2, v_2 in ipairs(v_1.items) do
				local itemType = v_2.itemType
				local var13 = if itemType == "Product" then Enum.InfoType.Product elseif itemType == "GamePass" then Enum.InfoType.GamePass else nil
				local var14 = tonumber(v_2.id)
				local var15 = if not (var13 == nil or var14 == nil) then t[makeRequestKey(var14, var13)] else nil
				
				if var15 ~= nil and var15.ok then
					if list_1 == nil then
						list_1 = table.create(#v_1.items)
						
						for i_3 = 1, i_2 - 1 do
							list_1[i_3] = v_1.items[i_3]
						end
					end
					list_1[i_2] = refreshShopItemFromProductInfo(v_2, var15.value)
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
	insertRecoveredItemsIntoSections = function(p8, p9, p10) --[[ line: 108 ]]
		-- upvalues: makeRequestKey (ref), toShopItem (ref)
		local t = {}
		
		for i, v in ipairs(p9) do
			t[makeRequestKey(v.request.id, v.request.infoType)] = v
		end
		local v_2
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in ipairs(p10) do
			v_2 = t[makeRequestKey(v_1.id, v_1.infoType)]
			
			if v_2 == nil or not v_2.ok then
				table.insert(t_2, v_1)
			else
				local sectionId = t_1[v_1.sectionId]
				
				if sectionId == nil then
					sectionId = {}
					t_1[v_1.sectionId] = sectionId
				end
				local var25 = toShopItem(v_2.value, v_1.itemType, v_1.id)
				var25.originalIndex = v_1.originalIndex
				table.insert(sectionId, var25)
			end
		end
		local list = table.create(#p8)
		
		for i_2, v_2 in ipairs(p8) do
			local id = t_1[v_2.id]
			
			if id == nil then
				list[i_2] = v_2
				continue
			end
			table.sort(id, function(p11, p12) --[[ line: 159 ]]
				return (p11.originalIndex or 0) < (p12.originalIndex or 0)
			end)
			local list_1 = table.create(#v_2.items + #id)
			local var21 = 1
			local var22 = 1
			while var21 <= #v_2.items or var22 <= #id do
				local var23 = v_2.items[var21]
				local var24 = id[var22]
				
				if var24 == nil then
					table.insert(list_1, var23)
					var21 += 1
				elseif var23 == nil then
					table.insert(list_1, var24)
					var22 += 1
				elseif (var23.originalIndex or 0) <= (var24.originalIndex or 0) then
					table.insert(list_1, var23)
					var21 += 1
				else
					table.insert(list_1, var24)
					var22 += 1
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