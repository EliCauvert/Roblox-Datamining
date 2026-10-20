local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local _ = require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UnavailableItemFilterModule = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.Reducers.ExternalNavigationRequest)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local FFlagAXRemoveCatalogCategoryNavKey = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveCatalogCategoryNavKey
local DeepLinkUtils = {
	parseSortType = function(SortType)
		-- upvalues: CatalogConstantsModule (copy)
		local Number: number? = tonumber(SortType)
		
		for _, enumItem in Enum.CatalogSortType:GetEnumItems() do
			if enumItem.Name:lower() == tostring(SortType):lower() then
				return Enum.CatalogSortType[enumItem.Name].Name
			elseif Number and enumItem.Value == Number then
				return Enum.CatalogSortType[enumItem.Name].Name
			end
		end
		return CatalogConstantsModule.DefaultFilters.CatalogSort
	end,
	parseSortAggregation = function(SortAggregation)
		-- upvalues: CatalogConstantsModule (copy)
		local Number: number? = tonumber(SortAggregation)
		
		for _, enumItem in Enum.CatalogSortAggregation:GetEnumItems() do
			local IsValueMatch: boolean = Number and enumItem.Value == Number
			local IsNameMatch: boolean = enumItem.Name == Enum.CatalogSortAggregation.AllTime.Name or (enumItem.Name == Enum.CatalogSortAggregation.PastWeek.Name or enumItem.Name == Enum.CatalogSortAggregation.PastDay.Name)
			
			if (enumItem.Name:lower() == tostring(SortAggregation):lower() or IsValueMatch) and IsNameMatch then
				return Enum.CatalogSortAggregation[enumItem.Name].Name
			end
		end
		return CatalogConstantsModule.DefaultFilters.CatalogSortAggregation
	end,
	parseSalesTypeFilter = function(SalesTypeFilter)
		-- upvalues: CatalogConstantsModule (copy)
		local Number: number? = tonumber(SalesTypeFilter)
		
		for _, enumItem in Enum.SalesTypeFilter:GetEnumItems() do
			if enumItem.Name:lower() == tostring(SalesTypeFilter):lower() then
				return Enum.SalesTypeFilter[enumItem.Name].Name
			elseif Number and enumItem.Value == Number then
				return Enum.SalesTypeFilter[enumItem.Name].Name
			end
		end
		return CatalogConstantsModule.DefaultFilters.SalesTypeFilter
	end
}

function DeepLinkUtils.buildCatalogFilterFromDeepLinkParams(CatalogFilterFromDeepLinkParams)
	-- upvalues: CatalogConstantsModule (copy), DeepLinkUtils (copy), UnavailableItemFilterModule (copy)
	local PriceRange = {
		minPrice = CatalogConstantsModule.DefaultFilters.PriceRange.minPrice,
		maxPrice = CatalogConstantsModule.DefaultFilters.PriceRange.maxPrice
	}
	
	if CatalogFilterFromDeepLinkParams.minPrice ~= nil then
		PriceRange.minPrice = tonumber(CatalogFilterFromDeepLinkParams.minPrice) or CatalogConstantsModule.DefaultFilters.PriceRange.minPrice
	end
	if CatalogFilterFromDeepLinkParams.maxPrice ~= nil then
		PriceRange.maxPrice = tonumber(CatalogFilterFromDeepLinkParams.maxPrice) or CatalogConstantsModule.DefaultFilters.PriceRange.maxPrice
	end
	local ParseSalesTypeFilterResult = DeepLinkUtils.parseSalesTypeFilter(CatalogFilterFromDeepLinkParams.salesTypeFilter)
	local CreatorName = CatalogFilterFromDeepLinkParams.creatorName or ""
	local Show = if CatalogFilterFromDeepLinkParams.includeNotForSale then UnavailableItemFilterModule.Show else CatalogConstantsModule.DefaultFilters.UnavailableItemFilter
	local ParseSortTypeResult = DeepLinkUtils.parseSortType(CatalogFilterFromDeepLinkParams.sortType)
	local ParseSortAggregationResult = DeepLinkUtils.parseSortAggregation(CatalogFilterFromDeepLinkParams.sortAggregation)
	local Number: number = tonumber(CatalogFilterFromDeepLinkParams.category) or 1
	local Number1: number = tonumber(CatalogFilterFromDeepLinkParams.subcategory) or 0
	local Topics = {}
	
	if CatalogFilterFromDeepLinkParams.topics then
		for i in string.gmatch(CatalogFilterFromDeepLinkParams.topics, "([^,]+)") do
			table.insert(Topics, i)
		end
	end
	return {
		wearTimeFilter = nil,
		creatorFilter = CreatorName,
		priceRange = PriceRange,
		salesTypeFilter = ParseSalesTypeFilterResult,
		unavailableItemFilter = Show,
		sortType = ParseSortTypeResult,
		sortAggregation = ParseSortAggregationResult,
		category = Number,
		subcategory = Number1,
		taxonomy = CatalogFilterFromDeepLinkParams.taxonomy,
		topics = Topics
	}
end

local function _(Catalog): boolean
	-- upvalues: AvatarScreen (copy)
	return Catalog == AvatarScreen.Catalog or (Catalog == AvatarScreen.CatalogSearch or Catalog == AvatarScreen.ItemDetails)
end

local _ = function(AvatarEditor): boolean
	-- upvalues: AvatarScreen (copy)
	return AvatarEditor == AvatarScreen.AvatarEditor or AvatarEditor == AvatarScreen.OutfitDetails
end

function DeepLinkUtils.catalogDeepLinkExists(p1): boolean
	-- upvalues: AvatarScreen (copy)
	local Screen = p1.screen
	
	if Screen == AvatarScreen.Catalog or (Screen == AvatarScreen.CatalogSearch or Screen == AvatarScreen.ItemDetails) then
		local Params = p1.params or {}
		
		return Params.creatorName ~= nil or (Params.minPrice ~= nil or (Params.maxPrice ~= nil or (Params.salesTypeFilter ~= nil or (Params.includeNotForSale ~= nil or (Params.sortType ~= nil or (Params.sortAggregation ~= nil or (Params.category ~= nil or Params.subcategory ~= nil))))))) or Params.taxonomy ~= nil
	else
		return false
	end
end

function DeepLinkUtils.catalogDeepLinkExists_deprecated(CatalogFilterFromDeepLinkParams): boolean
	return CatalogFilterFromDeepLinkParams.creatorName ~= nil or (CatalogFilterFromDeepLinkParams.minPrice ~= nil or (CatalogFilterFromDeepLinkParams.maxPrice ~= nil or (CatalogFilterFromDeepLinkParams.salesTypeFilter ~= nil or (CatalogFilterFromDeepLinkParams.includeNotForSale ~= nil or (CatalogFilterFromDeepLinkParams.sortType ~= nil or (CatalogFilterFromDeepLinkParams.sortAggregation ~= nil or CatalogFilterFromDeepLinkParams.category ~= nil)))))) or CatalogFilterFromDeepLinkParams.subcategory ~= nil
end

function DeepLinkUtils.avatarEditorDeepLinkExists(p1): boolean
	-- upvalues: AvatarScreen (copy)
	if not p1.params or p1.params.opaquePage ~= AvatarScreen.AvatarEditor then
		local Screen = p1.screen
		
		if Screen ~= AvatarScreen.AvatarEditor and Screen ~= AvatarScreen.OutfitDetails then
			return false
		end
	end
	local Params = p1.params or {}
	
	return Params.category ~= nil or Params.subcategory ~= nil
end

function DeepLinkUtils.newValidEquipDeepLinkExists(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return not p1.wasItemEquipped and not p1.fetchItemFailed and (p1.itemId ~= nil and p1.itemType ~= nil and (tonumber(p1.itemId) ~= nil and (p1.itemType == ConstantsModule.ItemType.Asset:lower() or p1.itemType == ConstantsModule.ItemType.Bundle:lower())))
end

function DeepLinkUtils.parseItemSubType(p1, p2)
	-- upvalues: CatalogUtilsModule (copy)
	return (CatalogUtilsModule.GetItemSubType(p1, p2))
end

function DeepLinkUtils.parseItemIdAndItemType(p1)
	-- upvalues: ConstantsModule (copy)
	local ItemType = p1.itemType
	
	if ItemType and p1.itemType:lower() == ConstantsModule.ItemType.Asset:lower() then
		ItemType = ConstantsModule.ItemType.Asset
	elseif ItemType and p1.itemType:lower() == ConstantsModule.ItemType.Bundle:lower() then
		ItemType = ConstantsModule.ItemType.Bundle
	end
	return p1.itemId, ItemType
end

function DeepLinkUtils.wasItemFromDeepLinkEquipped(p1, p2): boolean
	-- upvalues: AvatarScreen (copy)
	return p1 and p1.wasItemEquipped and p2 and p2.opaque.name ~= AvatarScreen.Catalog or false
end

function DeepLinkUtils.removeDeepLinkEntries(List)
	if List then
		for i, value in List do
			if value.fromDeepLink then
				table.remove(List, i)
				break
			end
		end
	end
end

function DeepLinkUtils.isValidCategorySubtypeForEquippedItem(p1, p2): boolean
	-- upvalues: FFlagAXRemoveCatalogCategoryNavKey (copy), ConstantsModule (copy), CatalogCategories (copy), CryoModule (copy)
	local JoinResult = {}
	local Total = 0
	
	if FFlagAXRemoveCatalogCategoryNavKey then
		if p1.Id == ConstantsModule.DefaultCatalogCategoryId then
			return true
		end
	elseif p1.NavigationKey == CatalogCategories.Recommended then
		return true
	end
	if p1.AssetTypeIdStrings then
		for _, assetTypeIdString in p1.AssetTypeIdStrings do
			JoinResult = CryoModule.Dictionary.join(JoinResult, { [assetTypeIdString] = ConstantsModule.ItemType.Asset })
		end
		Total += #p1.AssetTypeIdStrings
	end
	if p1.BundleTypes then
		for _, bundleType in p1.BundleTypes do
			JoinResult = CryoModule.Dictionary.join(JoinResult, { [bundleType] = ConstantsModule.ItemType.Bundle })
		end
		Total += #p1.BundleTypes
	end
	return if Total > 0 and p2.itemSubType then JoinResult[p2.itemSubType] == p2.itemType else false
end

function DeepLinkUtils.addEquippedItemToCatalogEntries(p3, p4, p5, Entry)
	-- upvalues: DeepLinkUtils (copy), GetTryOnItemReducerKeyFunction (copy)
	local ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2 = DeepLinkUtils.parseItemIdAndItemType(p3)
	local TryOnItemReducerKey = if ParseItemIdAndItemTypeResult and ParseItemIdAndItemTypeResult2 then GetTryOnItemReducerKeyFunction(ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2) else ParseItemIdAndItemTypeResult
	local v1: boolean = p4 and p4[TryOnItemReducerKey] ~= nil
	local v2 = p4 and p4[TryOnItemReducerKey]
	
	if v1 and Entry and #Entry > 0 and Entry[1].id ~= ParseItemIdAndItemTypeResult then
		DeepLinkUtils.removeDeepLinkEntries(Entry)
		
		if DeepLinkUtils.isValidCategorySubtypeForEquippedItem(p5, v2) then
			table.insert(Entry, 1, {
				fromDeepLink = true,
				id = ParseItemIdAndItemTypeResult,
				type = ParseItemIdAndItemTypeResult2
			})
			
			return
		end
	elseif not v1 and Entry then
		DeepLinkUtils.removeDeepLinkEntries(Entry)
	end
end

function DeepLinkUtils.convertCatalogSearchParamsV1ToV2(p3)
	local t = {}
	
	if not p3 or type(p3) ~= "table" then
		return t
	end
	if p3.creatorname then
		t.creatorName = p3.creatorname
	end
	return t
end

return DeepLinkUtils