local _ = require(script:FindFirstAncestor("InExperienceShop").Types)
local _ = require(script.Parent.multiGetProductInfo)
local ShopItemMappingModule = require(script.Parent.shopItemMapping)
local MakeRequestKeyFunction = ShopItemMappingModule.makeRequestKey
local ToShopItemFunction = ShopItemMappingModule.toShopItem
local GamePass = Enum.InfoType.GamePass

return {
	appendBonusItemRequests = function(List, List1) --[[ Line: 20 ]]
		-- upvalues: MakeRequestKeyFunction (copy), GamePass (copy)
		local t = {}
		
		for _, value in ipairs(List) do
			t[MakeRequestKeyFunction(value.id, value.infoType)] = true
		end
		for _, value1 in ipairs(List1) do
			local RobuxPackages = value1.robuxPackages
			
			if RobuxPackages ~= nil then
				for _, robuxPackage in RobuxPackages do
					local BonusItem = robuxPackage.bonusItem
					local NoBonusItem = BonusItem == nil or BonusItem.type ~= "GamePass"
					local RequestKey = nil
					
					if not NoBonusItem then
						RequestKey = MakeRequestKeyFunction(BonusItem.id, GamePass)
						NoBonusItem = t[RequestKey]
					end
					if not NoBonusItem then
						t[RequestKey] = true
						table.insert(List, { id = BonusItem.id, infoType = GamePass })
					end
				end
			end
		end
		return List
	end,
	mergeBonusItemDetailsIntoSections = function(List, List1) --[[ Line: 57 ]]
		-- upvalues: MakeRequestKeyFunction (copy), GamePass (copy), ToShopItemFunction (copy)
		local t = {}
		
		for _, value in ipairs(List1) do
			t[MakeRequestKeyFunction(value.request.id, value.request.infoType)] = value
		end
		local Buffer = table.create(#List)
		
		for i, value1 in ipairs(List) do
			local RobuxPackages = value1.robuxPackages
			
			if RobuxPackages == nil or #RobuxPackages == 0 then
				Buffer[i] = value1
				continue
			end
			local RobuxPackages1 = nil
			
			for i1, robuxPackage in ipairs(RobuxPackages) do
				local BonusItem = robuxPackage.bonusItem
				
				if BonusItem ~= nil then
					local Entry = t[MakeRequestKeyFunction(BonusItem.id, GamePass)]
					
					if Entry ~= nil and Entry.ok then
						if RobuxPackages1 == nil then
							RobuxPackages1 = table.create(#RobuxPackages)
							
							for i2 = 1, i1 - 1 do
								RobuxPackages1[i2] = RobuxPackages[i2]
							end
						end
						RobuxPackages1[i1] = {
							id = robuxPackage.id,
							robuxAmount = robuxPackage.robuxAmount,
							currencyAmountStr = robuxPackage.currencyAmountStr,
							robuxImage = robuxPackage.robuxImage,
							productId = robuxPackage.productId,
							mobileProductId = robuxPackage.mobileProductId,
							bonusItem = robuxPackage.bonusItem,
							bonusItemDetails = ToShopItemFunction(Entry.value, "GamePass", BonusItem.id),
							isPrimaryRobuxPackage = robuxPackage.isPrimaryRobuxPackage
						}
					elseif RobuxPackages1 ~= nil then
						RobuxPackages1[i1] = robuxPackage
					end
				elseif RobuxPackages1 ~= nil then
					RobuxPackages1[i1] = robuxPackage
				end
			end
			if RobuxPackages1 == nil then
				Buffer[i] = value1
			else
				for i3 = #RobuxPackages1 + 1, #RobuxPackages do
					RobuxPackages1[i3] = RobuxPackages[i3]
				end
				Buffer[i] = {
					id = value1.id,
					name = value1.name,
					items = value1.items,
					categoryType = value1.categoryType,
					stableCategoryId = value1.stableCategoryId,
					categoryGroup = value1.categoryGroup,
					paymentSessionId = value1.paymentSessionId,
					bonusJwt = value1.bonusJwt,
					robuxPackages = RobuxPackages1
				}
			end
		end
		return Buffer
	end
}