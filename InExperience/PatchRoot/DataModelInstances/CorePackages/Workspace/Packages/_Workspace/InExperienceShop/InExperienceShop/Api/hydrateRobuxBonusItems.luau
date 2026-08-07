local _ = require(script:FindFirstAncestor("InExperienceShop").Types)
local _ = require(script.Parent.multiGetProductInfo)
local shopItemMappingModule = require(script.Parent.shopItemMapping)
local makeRequestKey = shopItemMappingModule.makeRequestKey
local toShopItem = shopItemMappingModule.toShopItem
local gamePass = Enum.InfoType.GamePass

return {
	appendBonusItemRequests = function(p0, p1) --[[ line: 20 ]]
		-- upvalues: makeRequestKey (ref), gamePass (ref)
		local t = {}
		
		for i, v in ipairs(p0) do
			t[makeRequestKey(v.id, v.infoType)] = true
		end
		for i, v_1 in ipairs(p1) do
			local robuxPackages = v_1.robuxPackages
			
			if robuxPackages ~= nil then
				for i_2, v_2 in robuxPackages do
					local bonusItem = v_2.bonusItem
					
					if bonusItem ~= nil and bonusItem.type == "GamePass" then
						local var2 = makeRequestKey(bonusItem.id, gamePass)
						
						if not t[var2] then
							t[var2] = true
							table.insert(p0, { id = bonusItem.id, infoType = gamePass })
						end
					end
				end
			end
		end
		return p0
	end,
	mergeBonusItemDetailsIntoSections = function(p2, p3) --[[ line: 57 ]]
		-- upvalues: makeRequestKey (ref), gamePass (ref), toShopItem (ref)
		local t = {}
		
		for i, v in ipairs(p3) do
			t[makeRequestKey(v.request.id, v.request.infoType)] = v
		end
		local list = table.create(#p2)
		
		for i_1, v_1 in ipairs(p2) do
			local robuxPackages = v_1.robuxPackages
			
			if robuxPackages == nil or #robuxPackages == 0 then
				list[i_1] = v_1
				continue
			end
			local list_1 = nil
			
			for i_2, v_2 in ipairs(robuxPackages) do
				local bonusItem = v_2.bonusItem
				
				if bonusItem ~= nil then
					local id = t[makeRequestKey(bonusItem.id, gamePass)]
					
					if id ~= nil and id.ok then
						if list_1 == nil then
							list_1 = table.create(#robuxPackages)
							
							for i_4 = 1, i_2 - 1 do
								list_1[i_4] = robuxPackages[i_4]
							end
						end
						list_1[i_2] = {
							id = v_2.id,
							robuxAmount = v_2.robuxAmount,
							currencyAmountStr = v_2.currencyAmountStr,
							robuxImage = v_2.robuxImage,
							productId = v_2.productId,
							mobileProductId = v_2.mobileProductId,
							bonusItem = v_2.bonusItem,
							bonusItemDetails = toShopItem(id.value, "GamePass", bonusItem.id),
							isPrimaryRobuxPackage = v_2.isPrimaryRobuxPackage
						}
					elseif list_1 ~= nil then
						list_1[i_2] = v_2
					end
				elseif list_1 ~= nil then
					list_1[i_2] = v_2
				end
			end
			if list_1 == nil then
				list[i_1] = v_1
			else
				for i_3 = #list_1 + 1, #robuxPackages do
					list_1[i_3] = robuxPackages[i_3]
				end
				list[i_1] = {
					id = v_1.id,
					name = v_1.name,
					items = v_1.items,
					paymentSessionId = v_1.paymentSessionId,
					robuxPackages = list_1
				}
			end
		end
		return list
	end
}