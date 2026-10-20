local _ = require(script:FindFirstAncestor("InExperienceShop").Types)
local _ = require(script.Parent.multiGetProductInfo)
local ShopItemMappingModule = require(script.Parent.shopItemMapping)
local MakeRequestKeyFunction = ShopItemMappingModule.makeRequestKey
local ToShopItemFunction = ShopItemMappingModule.toShopItem

local function refreshShopItemFromProductInfo(p1, p2)
	-- upvalues: ToShopItemFunction (copy)
	local ShopItem = ToShopItemFunction(p2, p1.itemType, (tonumber(p1.id)))
	
	return {
		id = p1.id,
		itemType = p1.itemType,
		isOwned = p1.isOwned,
		creator = ShopItem.creator or p1.creator,
		universeId = p1.universeId,
		originalIndex = p1.originalIndex,
		name = ShopItem.name,
		thumbnail = ShopItem.thumbnail,
		price = ShopItem.price,
		description = ShopItem.description,
		updated = ShopItem.updated
	}
end

return {
	infoTypeForShopItemType = function(p1)
		return if p1 == "Product" then Enum.InfoType.Product elseif p1 == "GamePass" then Enum.InfoType.GamePass else nil
	end,
	buildRequestsFromSections = function(List)
		-- upvalues: MakeRequestKeyFunction (copy)
		local List1 = {}
		local t = {}
		
		for _, value in ipairs(List) do
			for _, item in ipairs(value.items) do
				local ItemType = item.itemType
				local Product = if ItemType == "Product" then Enum.InfoType.Product elseif ItemType == "GamePass" then Enum.InfoType.GamePass else nil
				local NoProduct = Product == nil
				local Number = nil
				
				if not NoProduct then
					Number = tonumber(item.id)
					NoProduct = Number == nil
				end
				local Entry = NoProduct
				local RequestKey = nil
				
				if not Entry then
					RequestKey = MakeRequestKeyFunction(Number, Product)
					Entry = t[RequestKey]
				end
				if not Entry then
					t[RequestKey] = true
					table.insert(List1, { id = Number, infoType = Product })
				end
			end
		end
		return List1
	end,
	appendFailedItemRequests = function(List, List1)
		-- upvalues: MakeRequestKeyFunction (copy)
		local t = {}
		
		for _, value in ipairs(List) do
			t[MakeRequestKeyFunction(value.id, value.infoType)] = true
		end
		for _, value1 in ipairs(List1) do
			local RequestKey = MakeRequestKeyFunction(value1.id, value1.infoType)
			
			if not t[RequestKey] then
				t[RequestKey] = true
				table.insert(List, { id = value1.id, infoType = value1.infoType })
			end
		end
		return List
	end,
	refreshShopItemFromProductInfo = refreshShopItemFromProductInfo,
	mergeProductInfoIntoSections = function(List, List1)
		-- upvalues: MakeRequestKeyFunction (copy), refreshShopItemFromProductInfo (copy)
		local t = {}
		
		for _, value in ipairs(List1) do
			t[MakeRequestKeyFunction(value.request.id, value.request.infoType)] = value
		end
		local Buffer = table.create(#List)
		
		for i, value1 in ipairs(List) do
			local Items = nil
			
			for i1, item in ipairs(value1.items) do
				local ItemType = item.itemType
				local Product = if ItemType == "Product" then Enum.InfoType.Product elseif ItemType == "GamePass" then Enum.InfoType.GamePass else nil
				local Number: number? = tonumber(item.id)
				local Entry = if Product ~= nil and Number ~= nil then t[MakeRequestKeyFunction(Number, Product)] else nil
				
				if Entry ~= nil and Entry.ok then
					if Items == nil then
						Items = table.create(#value1.items)
						
						for i2 = 1, i1 - 1 do
							Items[i2] = value1.items[i2]
						end
					end
					Items[i1] = refreshShopItemFromProductInfo(item, Entry.value)
				elseif Items ~= nil then
					Items[i1] = item
				end
			end
			if Items == nil then
				Buffer[i] = value1
			else
				Buffer[i] = {
					id = value1.id,
					name = value1.name,
					items = Items,
					paymentSessionId = value1.paymentSessionId,
					robuxPackages = value1.robuxPackages
				}
			end
		end
		return Buffer
	end,
	insertRecoveredItemsIntoSections = function(List2, List3, List4)
		-- upvalues: MakeRequestKeyFunction (copy), ToShopItemFunction (copy)
		local t = {}
		
		for _, value in ipairs(List3) do
			t[MakeRequestKeyFunction(value.request.id, value.request.infoType)] = value
		end
		local t1 = {}
		local List5 = {}
		
		for _, value1 in ipairs(List4) do
			local Entry = t[MakeRequestKeyFunction(value1.id, value1.infoType)]
			
			if Entry == nil or not Entry.ok then
				table.insert(List5, value1)
			else
				local List = t1[value1.sectionId]
				
				if List == nil then
					List = {}
					t1[value1.sectionId] = List
				end
				local ShopItem = ToShopItemFunction(Entry.value, value1.itemType, value1.id)
				ShopItem.originalIndex = value1.originalIndex
				table.insert(List, ShopItem)
			end
		end
		local Buffer = table.create(#List2)
		
		for i, value2 in ipairs(List2) do
			local List1 = t1[value2.id]
			
			if List1 == nil then
				Buffer[i] = value2
				continue
			end
			table.sort(List1, function(A, B): boolean
				return (A.originalIndex or 0) < (B.originalIndex or 0)
			end)
			local Buffer1 = table.create(#value2.items + #List1)
			local Count = 1
			local Count1 = 1
			while Count <= #value2.items or Count1 <= #List1 do
				local Item = value2.items[Count]
				local Entry = List1[Count1]
				
				if Entry == nil then
					table.insert(Buffer1, Item)
					Count += 1
				elseif Item == nil then
					table.insert(Buffer1, Entry)
					Count1 += 1
				elseif (Item.originalIndex or 0) <= (Entry.originalIndex or 0) then
					table.insert(Buffer1, Item)
					Count += 1
				else
					table.insert(Buffer1, Entry)
					Count1 += 1
				end
			end
			Buffer[i] = {
				id = value2.id,
				name = value2.name,
				items = Buffer1,
				paymentSessionId = value2.paymentSessionId,
				robuxPackages = value2.robuxPackages
			}
		end
		return Buffer, List5
	end
}