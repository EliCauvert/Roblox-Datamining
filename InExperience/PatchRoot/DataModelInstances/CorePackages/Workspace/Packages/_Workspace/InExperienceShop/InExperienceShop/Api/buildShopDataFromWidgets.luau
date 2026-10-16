local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local FFlagEnableRobuxInExperienceShop = SharedFlagsModule.FFlagEnableRobuxInExperienceShop
local FFlagEnableBonusJwtInShop = SharedFlagsModule.FFlagEnableBonusJwtInShop
local _ = require(script.Parent.multiGetProductInfo)
local ShopItemMappingModule = require(script.Parent.shopItemMapping)
local HydrateRobuxBonusItemsModule = require(script.Parent.hydrateRobuxBonusItems)
local ToRobuxPackageItemFunction = require(script.Parent.robuxWidgetMapping).toRobuxPackageItem
local AppendBonusItemRequestsFunction = HydrateRobuxBonusItemsModule.appendBonusItemRequests
local MergeBonusItemDetailsIntoSectionsFunction = HydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections
local MakeRequestKeyFunction = ShopItemMappingModule.makeRequestKey
local ToShopItemFunction = ShopItemMappingModule.toShopItem
local LogCounterModule = require(InExperienceShop.Internal.logCounter)
local ProductInfoFailedItemsCounterModule = require(InExperienceShop.Events.ProductInfoFailedItemsCounter)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagIdentifyTopPicksByCategoryTypeModule = require(InExperienceShop.Flags.FFlagIdentifyTopPicksByCategoryType)
local FFlagParseStableCategoryIdModule = require(InExperienceShop.Flags.FFlagParseStableCategoryId)
local config = {
	name = "CommonUI.Features.Label.Home",
	id = ConstantsModule.HOME_CATEGORY_ID
}

return function(p1, Callback) --[[ Line: 92 | Named "buildShopDataFromWidgets" ]]
	-- upvalues: config (copy), ConstantsModule (copy), FFlagIdentifyTopPicksByCategoryTypeModule (copy), FFlagParseStableCategoryIdModule (copy), FFlagEnableRobuxInExperienceShop (copy), FFlagEnableBonusJwtInShop (copy), ToRobuxPackageItemFunction (copy), PromiseModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), AppendBonusItemRequestsFunction (copy), MakeRequestKeyFunction (copy), ToShopItemFunction (copy), LogCounterModule (copy), ProductInfoFailedItemsCounterModule (copy), MergeBonusItemDetailsIntoSectionsFunction (copy)
	local List = { config }
	local t = {}
	local List1 = {}
	local List2 = {}
	local t1 = {}
	
	for _, category in ipairs(p1.categories) do
		if not ConstantsModule.BLACKLISTED_CATEGORY_NAMES[string.lower(category.name)] then
			local Text = tostring(category.id)
			table.insert(List, { id = Text, name = category.name })
			local CategoryIndex = #t + 1
			local config1 = { id = Text, name = category.name, items = {} }
			local Metadata = category.metadata
			
			if FFlagIdentifyTopPicksByCategoryTypeModule and Metadata ~= nil and Metadata.categoryType ~= nil then
				config1.categoryType = Metadata.categoryType
			end
			if FFlagParseStableCategoryIdModule and Metadata ~= nil and Metadata.categoryId ~= nil then
				config1.stableCategoryId = Metadata.categoryId
			end
			if FFlagParseStableCategoryIdModule and Metadata ~= nil and Metadata.categoryGroup ~= nil then
				config1.categoryGroup = Metadata.categoryGroup
			end
			if FFlagEnableRobuxInExperienceShop and Metadata ~= nil and Metadata.paymentSessionId ~= nil then
				config1.paymentSessionId = Metadata.paymentSessionId
			end
			if FFlagEnableBonusJwtInShop and Metadata ~= nil and Metadata.bonusJwt ~= nil then
				config1.bonusJwt = Metadata.bonusJwt
			end
			t[CategoryIndex] = config1
			local SectionItemIndex = 0
			
			for _, item in ipairs(category.items) do
				local Type = item.type
				local Product = nil
				local ItemType = nil
				
				if Type == "Product" then
					Product = Enum.InfoType.Product
					ItemType = Type
				elseif Type == "GamePass" then
					Product = Enum.InfoType.GamePass
					ItemType = Type
				else
					if Type == "Robux" and FFlagEnableRobuxInExperienceShop then
						local RobuxPackageItem = ToRobuxPackageItemFunction(item)
						
						if RobuxPackageItem ~= nil then
							if config1.robuxPackages == nil then
								config1.robuxPackages = {}
							end
							local RobuxPackages = config1.robuxPackages
							
							if #RobuxPackages == 0 then
								RobuxPackageItem.isPrimaryRobuxPackage = true
							end
							table.insert(RobuxPackages, RobuxPackageItem)
							continue
						end
						continue
					end
					continue
				end
				SectionItemIndex += 1
				t1[CategoryIndex] = true
				table.insert(List1, { id = item.id, infoType = Product })
				table.insert(List2, {
					categoryIndex = CategoryIndex,
					sectionId = Text,
					itemType = ItemType,
					sectionItemIndex = SectionItemIndex
				})
			end
		end
	end
	local function filterOutput(List1) --[[ Line: 215 ]]
		-- upvalues: t1 (copy), List (copy), ConstantsModule (upval)
		local List2 = {}
		local t = {}
		
		for i, value in ipairs(List1) do
			if t1[i] or value.robuxPackages ~= nil and #value.robuxPackages > 0 then
				table.insert(List2, value)
				t[value.id] = true
			end
		end
		local List3 = {}
		
		for _, value1 in ipairs(List) do
			if value1.id == ConstantsModule.HOME_CATEGORY_ID or t[value1.id] then
				table.insert(List3, value1)
			end
		end
		return List3, List2
	end
	
	if Callback == nil then
		local Buffer = table.create(#List1)
		
		for i, value in ipairs(List1) do
			local Entry = List2[i]
			Buffer[i] = {
				id = value.id,
				infoType = value.infoType,
				itemType = Entry.itemType,
				sectionId = Entry.sectionId,
				originalIndex = Entry.sectionItemIndex
			}
		end
		local FilterOutputResult, FilterOutputResult2 = filterOutput(t)
		
		return PromiseModule.resolve({
			categories = FilterOutputResult,
			sections = FilterOutputResult2,
			failedItems = Buffer,
			metadata = if FFlagEnableExperienceShopGlobalIconModule then p1.metadata else nil
		})
	else
		local CountList1 = #List1
		
		if FFlagEnableRobuxInExperienceShop then
			AppendBonusItemRequestsFunction(List1, t)
		end
		return Callback(List1):andThen(function(Result) --[[ Line: 260 ]]
			-- upvalues: MakeRequestKeyFunction (upval), CountList1 (copy), List1 (copy), List2 (copy), t (copy), ToShopItemFunction (upval), LogCounterModule (upval), ProductInfoFailedItemsCounterModule (upval), FFlagEnableRobuxInExperienceShop (upval), MergeBonusItemDetailsIntoSectionsFunction (upval), filterOutput (copy), FFlagEnableExperienceShopGlobalIconModule (upval), p1 (copy)
			local t2 = {}
			
			for _, value in ipairs(Result) do
				t2[MakeRequestKeyFunction(value.request.id, value.request.infoType)] = value
			end
			local FailedItems = {}
			
			for i = 1, CountList1 do
				local Entry = List1[i]
				local Entry1 = List2[i]
				local Entry2 = t2[MakeRequestKeyFunction(Entry.id, Entry.infoType)]
				
				if Entry2 == nil or not Entry2.ok then
					table.insert(FailedItems, {
						id = Entry.id,
						infoType = Entry.infoType,
						itemType = Entry1.itemType,
						sectionId = Entry1.sectionId,
						originalIndex = Entry1.sectionItemIndex
					})
				else
					local Entry3 = t[Entry1.categoryIndex]
					local ShopItem = ToShopItemFunction(Entry2.value, Entry1.itemType, Entry.id)
					ShopItem.originalIndex = Entry1.sectionItemIndex
					table.insert(Entry3.items, ShopItem)
				end
			end
			if #FailedItems > 0 then
				LogCounterModule(ProductInfoFailedItemsCounterModule, #FailedItems)
			end
			local FilterOutputResult, FilterOutputResult2 = filterOutput(if FFlagEnableRobuxInExperienceShop then MergeBonusItemDetailsIntoSectionsFunction(t, Result) else t)
			
			return {
				categories = FilterOutputResult,
				sections = FilterOutputResult2,
				failedItems = FailedItems,
				metadata = if FFlagEnableExperienceShopGlobalIconModule then p1.metadata else nil
			}
		end)
	end
end