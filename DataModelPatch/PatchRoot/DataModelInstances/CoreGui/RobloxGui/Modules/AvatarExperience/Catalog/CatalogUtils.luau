local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local DashModule = require(CorePackages.Packages.Dash)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local TutilsModule = require(CorePackages.Packages.tutils)
local TModule = require(CorePackages.Packages.t)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local GetCatalogCategoriesMapModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesMap)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances)
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInfo)
local _ = require(Modules.AvatarExperience.Common.Types)
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SelectCurrentAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectCurrentAvatarRoute
local GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule = require(Modules.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation)
local GetFFlagAXEnableErrorLoggingForSubcategorySelectionByIdModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableErrorLoggingForSubcategorySelectionById)
local FFlagAXPassScreenSizeToWidgetApi = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXPassScreenSizeToWidgetApi
local CatalogUtils = {
	HasAttribution = function(p1): boolean
		return if p1 and p1.creatingUniverseId then true else false
	end,
	GetItemSubType = function(Asset, p1)
		-- upvalues: ConstantsModule (copy)
		if not p1 then return end
		return if Asset == ConstantsModule.ItemType.Asset then p1.assetType elseif Asset == ConstantsModule.ItemType.Bundle then p1.bundleType else nil
	end,
	Round = function(p1: number): number
		return (math.floor(p1 + 0.5))
	end,
	bankersRounding = function(Value: number): number
		local Floored = math.floor(Value)
		
		return if Value - Floored == 0.5 then if Floored % 2 == 0 then Floored else Floored + 1 else math.round(Value)
	end,
	HasPremiumBenefits = function(p1): boolean
		return if p1 then p1.premiumPricing ~= nil else false
	end,
	IsResellable = function(p1)
		-- upvalues: CatalogConstantsModule (copy)
		if p1 then
			local NumberRobloxHasAvailable = p1.numberRobloxHasAvailable
			local ItemRestrictions = p1.itemRestrictions
			local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
			local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
			
			return ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction1 or ItemRestriction and (NumberRobloxHasAvailable and NumberRobloxHasAvailable == 0))
		else
			return false
		end
	end,
	isLimitedCollectible = function(p1)
		-- upvalues: CatalogConstantsModule (copy)
		return p1 and (p1.itemRestrictions and p1.itemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]) or false
	end,
	hasLimitedQuantity = function(p1)
		-- upvalues: CatalogConstantsModule (copy)
		if p1 then
			local ItemRestrictions = p1.itemRestrictions
			local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
			local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
			
			return ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		else
			return nil
		end
	end
}

function CatalogUtils.isUnlimitedCollectibleAsset(Asset, p1): boolean?
	-- upvalues: CatalogUtils (copy), ConstantsModule (copy)
	if Asset and p1 then
		local IsNotCollectibleItemIdMatch: boolean = p1.collectibleItemId and p1.collectibleItemId ~= ""
		local IsAssetMatch: boolean = Asset and Asset == ConstantsModule.ItemType.Asset
		
		return not CatalogUtils.hasLimitedQuantity(p1) and (IsNotCollectibleItemIdMatch and IsAssetMatch)
	else
		return nil
	end
end

function CatalogUtils.isLimitedBundle(Bundle, p1): boolean?
	-- upvalues: CatalogUtils (copy), ConstantsModule (copy)
	if Bundle and p1 then
		local IsNotCollectibleItemIdMatch: boolean = p1.collectibleItemId and p1.collectibleItemId ~= ""
		local IsBundleMatch: boolean = Bundle and Bundle == ConstantsModule.ItemType.Bundle
		
		return CatalogUtils.hasLimitedQuantity(p1) and (IsNotCollectibleItemIdMatch and IsBundleMatch)
	else
		return nil
	end
end

function CatalogUtils.isUnlimitedCollectibleBundle(Bundle, p1): boolean?
	-- upvalues: CatalogUtils (copy), ConstantsModule (copy)
	if Bundle and p1 then
		local IsNotCollectibleItemIdMatch: boolean = p1.collectibleItemId and p1.collectibleItemId ~= ""
		local IsBundleMatch: boolean = Bundle and Bundle == ConstantsModule.ItemType.Bundle
		
		return not CatalogUtils.hasLimitedQuantity(p1) and (IsNotCollectibleItemIdMatch and IsBundleMatch)
	else
		return nil
	end
end

function CatalogUtils.isOriginalStockSellableInShop(p1): boolean
	-- upvalues: CatalogConstantsModule (copy)
	if p1 then
		local SaleLocationType = p1.saleLocationType or CatalogConstantsModule.SaleLocationType.Invalid
		
		return SaleLocationType == CatalogConstantsModule.SaleLocationType.ShopOnly or (SaleLocationType == CatalogConstantsModule.SaleLocationType.ShopAndMyExperiences or (SaleLocationType == CatalogConstantsModule.SaleLocationType.ShopAndAllExperiences or SaleLocationType == CatalogConstantsModule.SaleLocationType.ShopAndExperiencesById))
	else
		return true
	end
end

function CatalogUtils.isCollectibleSellableInShop(p1)
	-- upvalues: CatalogUtils (copy), CatalogConstantsModule (copy)
	if not p1 then
		return true
	end
	assert(p1, "silence type checker")
	local IsOriginalStockSellableInShop = CatalogUtils.isOriginalStockSellableInShop(p1)
	local v1 = (p1.unitsAvailableForConsumption or (p1.numberRobloxHasAvailable or 0)) > 0
	local HasResellers = p1.hasResellers
	
	if p1.resaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled and not v1 then
		return false
	else
		local v2: boolean = p1.experiences and #p1.experiences > 0
		
		return v1 and (IsOriginalStockSellableInShop or v2) or HasResellers
	end
end

local function _(p1, p2): boolean
	-- upvalues: TutilsModule (copy)
	return if p1 and p1.quantityLimitPerUser and p2 then p1.quantityLimitPerUser > 0 and p1.quantityLimitPerUser <= TutilsModule.fieldCount(p2) else false
end

function CatalogUtils.reachQuantityLimit(p1, p2): boolean
	-- upvalues: TutilsModule (copy)
	return if p1 and p1.quantityLimitPerUser and p2 then p1.quantityLimitPerUser > 0 and p1.quantityLimitPerUser <= TutilsModule.fieldCount(p2) else false
end

function CatalogUtils.shouldShowQuantityLimit(p1: number): boolean
	return p1 and p1 > 0
end

function CatalogUtils.GetRbxThumbType(Asset)
	-- upvalues: ConstantsModule (copy), Constants (copy)
	return if Asset == ConstantsModule.ItemType.Asset then Constants.RbxthumbTypes.Asset elseif Asset == ConstantsModule.ItemType.Bundle then Constants.RbxthumbTypes.BundleThumbnail elseif Asset == ConstantsModule.ItemType.Look then Constants.RbxthumbTypes.Look else nil
end

function CatalogUtils.GetSponsoredItemsKey(p1, p2): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.SponsoredItemsDataKey .. "." .. tostring(p1) .. "." .. tostring(p2)
end

function CatalogUtils.GetItemDetailsKey(Text, Text1)
	-- upvalues: CatalogConstantsModule (copy)
	return if Text and Text1 then CatalogConstantsModule.ItemDetailsKey .. Text .. Text1 else CatalogConstantsModule.ItemDetailsKey
end

function CatalogUtils.GetBatchItemDetailsKey(List, Text)
	-- upvalues: CatalogConstantsModule (copy)
	return if List and Text then (CatalogConstantsModule.BatchItemDetailsKey .. Text) .. table.concat(List, ",") else CatalogConstantsModule.BatchItemDetailsKey
end

function CatalogUtils.getFetchWidgetInfoFetchKey(p1, p2, p3): string
	-- upvalues: FFlagAXPassScreenSizeToWidgetApi (copy), CatalogConstantsModule (copy)
	return if FFlagAXPassScreenSizeToWidgetApi then CatalogConstantsModule.FetchWidgetInfoKey .. (p1 or "") .. (p2 or "") .. (p3 or "") else CatalogConstantsModule.FetchWidgetInfoKey .. (p1 or "") .. (p2 or "")
end

function CatalogUtils.GetStatus(p1)
	-- upvalues: CatalogConstantsModule (copy), ItemTileEnums (copy)
	if not p1 then return end
	local ItemStatus = p1.itemStatus
	
	if not ItemStatus then return end
	if #ItemStatus == 0 then return end
	local t = {}
	
	for _, value in ItemStatus do
		t[value] = true
	end
	local Alert = nil
	local New = nil
	
	if t[CatalogConstantsModule.ItemStatus.Sale] then
		Alert = ItemTileEnums.StatusStyle.Alert
		New = CatalogConstantsModule.ItemStatusLocale.Sale
		
		return Alert, New
	end
	if t[CatalogConstantsModule.ItemStatus.New] then
		Alert = ItemTileEnums.StatusStyle.Info
		New = CatalogConstantsModule.ItemStatusLocale.New
	end
	return Alert, New
end

function CatalogUtils.getIsTradable(p2)
	-- upvalues: CatalogConstantsModule (copy)
	local ItemRestrictions = p2 and p2.itemRestrictions
	
	return if ItemRestrictions then if ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] then true elseif ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique] then true else not ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible] and nil else nil
end

CatalogUtils.splitEntries = MemoizeFunction(function(p2, p3: number, p4)
	-- upvalues: DashModule (copy)
	local Largest = math.max(1, 1 + (p3 - 1) * p4)
	
	return DashModule.slice(p2, 1, Largest - 1), (DashModule.slice(p2, Largest))
end)

function CatalogUtils.getTopicRequestKey(Tbl, p2, p3): string
	-- upvalues: DashModule (copy)
	local Text: string = if p3 then `[{p3 or ""}]` else ""
	
	if #Tbl > 0 then
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		Text ..= table.concat(Copy, ",")
	end
	return if #Text > 0 then Text elseif p2 then table.concat(DashModule.map(p2, function(p4): string
		return tostring(p4.itemType) .. tostring(p4.targetId)
	end)) else ""
end

local T = nil

local function assetTypeHasCatalogPage(p2): boolean
	-- upvalues: GetCatalogCategoriesFromStoreModule (copy)
	for _, value in GetCatalogCategoriesFromStoreModule() do
		if not value.Subcategories then
			if value.AssetTypeIdStrings then
				for _, assetTypeIdString1 in value.AssetTypeIdStrings do
					if assetTypeIdString1 == p2 then
						return true
					end
				end
			end
			continue
		end
		for _, subcategory in value.Subcategories do
			if subcategory.Name ~= "Community" and subcategory.AssetTypeIdStrings then
				for _, assetTypeIdString in subcategory.AssetTypeIdStrings do
					if assetTypeIdString == p2 then
						return true
					end
				end
			end
		end
	end
	return false
end

function CatalogUtils.doesAssetTypeHaveCatalogPage(p3): boolean
	-- upvalues: T (ref), ConstantsModule (copy), assetTypeHasCatalogPage (copy)
	if not T then
		T = {}
		
		for _, assetTypeIdString in ConstantsModule.AssetTypeIdStrings do
			if assetTypeHasCatalogPage(assetTypeIdString) then
				T[assetTypeIdString] = true
			end
		end
	end
	return T[p3] == true
end

function CatalogUtils.getRecommendedItemsGridItemTitleHeight(p4, p5)
	return (p4.BaseSize * p4.Header2.RelativeSize + (p5 or 0)) * 2
end

CatalogUtils.findCheapestCollectiblePurchaseInfo = MemoizeFunction(function(p4, p5, p6, p7)
	-- upvalues: GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule (copy), CatalogUtils (copy), TutilsModule (copy)
	local t = {}
	
	if not p4 then
		return t
	end
	assert(p4, "silence type checker")
	local v1 = p5[p4]
	
	if not v1 or not v1.unitsAvailableForConsumption or not v1.price then
		return t
	end
	local Inverted = not GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule() or CatalogUtils.isOriginalStockSellableInShop(v1)
	local IsFieldCountResultAbove = false
	
	if v1.quantityLimitPerUser and p7 and p7[p4] then
		local v2 = p7[p4]
		IsFieldCountResultAbove = if v1 and v1.quantityLimitPerUser and v2 and v1.quantityLimitPerUser > 0 then TutilsModule.fieldCount(v2) >= v1.quantityLimitPerUser else false
	end
	if Inverted and not IsFieldCountResultAbove and v1.unitsAvailableForConsumption > 0 then
		t.price = v1.price
	end
	local v3 = p6[p4]
	
	if v3 and #v3.InstanceIdsList > 0 then
		local InstancesEntry = v3.Instances[v3.InstanceIdsList[1]]
		
		if not Inverted or v1.unitsAvailableForConsumption == 0 or InstancesEntry.price < t.price or IsFieldCountResultAbove then
			t.collectibleInstanceId = InstancesEntry.collectibleInstanceId
			t.price = InstancesEntry.price
			t.expectedSellerId = InstancesEntry.seller.sellerId
			t.sellerName = InstancesEntry.seller.name
		end
	end
	return t
end)

function CatalogUtils.findCheapestCollectiblePurchaseInfoV2(p4, p5, p6, p7, p8)
	-- upvalues: CatalogUtils (copy)
	local t = {}
	
	if not p4 then
		return t
	end
	assert(p4, "silence type checker")
	local v1 = p6[p4]
	
	if v1 and not p5 then
		t.price = v1.price
		
		return t
	else
		return (CatalogUtils.findCheapestCollectiblePurchaseInfo(p4, p6, p7, p8))
	end
end

function CatalogUtils.getQueryStringForSearchWidgets(p4): string?
	if not p4 or not p4.searchKeyword then
		return nil
	end
	local List = { p4.searchKeyword }
	
	if p4.sortAndFilters and p4.sortAndFilters.SelectedTopics then
		for _, selectedTopic in p4.sortAndFilters.SelectedTopics do
			table.insert(List, 1, selectedTopic)
		end
	end
	return table.concat(List, " ")
end

function CatalogUtils.getCategoryName(p5)
	-- upvalues: TModule (copy), GetCatalogCategoriesFromStoreModule (copy)
	assert(TModule.number(p5), "Expected categoryIndex to be a number")
	local CatalogCategoriesFromStoreModuleEntry = GetCatalogCategoriesFromStoreModule()[p5]
	
	return CatalogCategoriesFromStoreModuleEntry and CatalogCategoriesFromStoreModuleEntry.Name
end

function CatalogUtils.getCategoryId(p5)
	-- upvalues: GetCatalogCategoriesMapModule (copy)
	return GetCatalogCategoriesMapModule()[p5]
end

function CatalogUtils.extractCategoryById(Id, List)
	-- upvalues: TModule (copy)
	assert(TModule.string(Id), "Expected categoryId to be a string")
	local v1 = nil
	
	for _, value in List do
		if value.Id == Id then
			v1 = value
			
			return v1
		end
	end
	return v1
end

function CatalogUtils.extractSubcategoryById(Id, List)
	-- upvalues: TModule (copy)
	assert(TModule.string(Id), "Expected subcategoryId to be a string")
	local v2 = nil
	
	for _, value in List do
		if value.Id == Id then
			v2 = value
			
			return v2
		end
	end
	return v2
end

function CatalogUtils.findCategoryByCategoryId(CategoryId, List)
	if not CategoryId then
		return nil
	end
	for _, value in List do
		if value.CategoryId == CategoryId then
			return value
		end
	end
	return nil
end

function CatalogUtils.findSubcategoryBySubcategoryId(SubcategoryId, List)
	if not SubcategoryId then
		return nil
	end
	for _, value in List do
		if value.SubcategoryId == SubcategoryId then
			return value
		end
	end
	return nil
end

function CatalogUtils.findCategoryIdsByTaxonomy(Text: string, List)
	if not Text then
		return nil, nil
	end
	for _, value in List do
		if value.TaxonomyUuid and string.lower(value.TaxonomyUuid) == string.lower(Text) then
			return value.Id, nil
		end
		if value.Subcategories then
			for _, subcategory in value.Subcategories do
				if subcategory.TaxonomyUuid and string.lower(subcategory.TaxonomyUuid) == string.lower(Text) then
					return value.Id, subcategory.Id
				end
			end
		end
	end
	return nil, nil
end

function CatalogUtils.getCategoryNameById(SelectedCategoryIdResult)
	-- upvalues: CatalogUtils (copy)
	local CategoryId = CatalogUtils.getCategoryId(SelectedCategoryIdResult)
	
	return CategoryId and CategoryId.Name
end

function CatalogUtils.getSubcategoryId(p5, p6)
	-- upvalues: TModule (copy), CatalogUtils (copy)
	assert(TModule.tuple(TModule.string, TModule.string)(p5, p6), "Expected categoryId and subcategoryId to be strings")
	local Subcategories = nil
	local CategoryId = CatalogUtils.getCategoryId(p5)
	
	if CategoryId and CategoryId.SubcategoriesMap then
		Subcategories = CategoryId.SubcategoriesMap[p6]
	end
	return Subcategories
end

function CatalogUtils.getSubcategoryNameById(p5, p6)
	-- upvalues: CatalogUtils (copy)
	local SubcategoryId = CatalogUtils.getSubcategoryId(p5, p6)
	
	return SubcategoryId and SubcategoryId.Name
end

function CatalogUtils.getSubcategoryNameByIdWithErrorLogging(SelectedCategoryIdResult, SelectedSubcategoryIdResult)
	-- upvalues: CatalogUtils (copy), GetFFlagAXEnableErrorLoggingForSubcategorySelectionByIdModule (copy), MutedErrorModule (copy)
	local SubcategoryNameById = CatalogUtils.getSubcategoryNameById(SelectedCategoryIdResult, SelectedSubcategoryIdResult)
	
	if GetFFlagAXEnableErrorLoggingForSubcategorySelectionByIdModule() and SelectedCategoryIdResult and SelectedSubcategoryIdResult and not SubcategoryNameById then
		MutedErrorModule("getSubcategoryNameById returned nil for subcategoryId: " .. SelectedSubcategoryIdResult .. " and categoryId: " .. SelectedCategoryIdResult)
	end
	return SubcategoryNameById
end

function CatalogUtils.findCategoryIndexById(List, Id)
	for i, value in List do
		if value.Id == Id then
			return i
		end
	end
	return nil
end

function CatalogUtils.getSubcategoryName(p5, p6)
	-- upvalues: TModule (copy), GetCatalogCategoriesFromStoreModule (copy)
	assert(TModule.tuple(TModule.number, TModule.number)(p5, p6), "Expected categoryIndex and subcategoryIndex to be numbers")
	local Name = nil
	local CatalogCategoriesFromStoreModuleEntry = GetCatalogCategoriesFromStoreModule()[p5]
	
	if CatalogCategoriesFromStoreModuleEntry then
		local Subcategory = CatalogCategoriesFromStoreModuleEntry.Subcategories and CatalogCategoriesFromStoreModuleEntry.Subcategories[p6]
		Name = Subcategory and Subcategory.Name
	end
	return Name
end

function CatalogUtils.getCurrentCategoryNames(p5)
	-- upvalues: GetCatalogCategoriesStoreModule (copy), CatalogUtils (copy)
	if not p5 or not p5.AvatarExperience or not p5.AvatarExperience.Catalog then
		return nil
	end
	local t = {}
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local SelectedCategoryIdResult = CatalogSelectionStore.selectedCategoryId(false)
	local SelectedSubcategoryIdResult = CatalogSelectionStore.selectedSubcategoryId(false)
	
	if SelectedCategoryIdResult then
		t.catalogCategory = CatalogUtils.getCategoryNameById(SelectedCategoryIdResult)
		
		if SelectedSubcategoryIdResult then
			t.catalogSubcategory = CatalogUtils.getSubcategoryNameByIdWithErrorLogging(SelectedCategoryIdResult, SelectedSubcategoryIdResult)
		else
			t.catalogSubcategory = nil
		end
	end
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	local SelectedCategoryIdResult1 = CatalogSearchSelectionStore.selectedCategoryId(false)
	local SelectedSubcategoryIdResult1 = CatalogSearchSelectionStore.selectedSubcategoryId(false)
	
	if SelectedCategoryIdResult1 then
		t.catalogSearchCategory = CatalogUtils.getCategoryNameById(SelectedCategoryIdResult1)
		
		if SelectedSubcategoryIdResult1 then
			t.catalogSearchSubcategory = CatalogUtils.getSubcategoryNameByIdWithErrorLogging(SelectedCategoryIdResult1, SelectedSubcategoryIdResult1)
			
			return t
		end
		t.catalogSearchSubcategory = nil
	end
	return t
end

function CatalogUtils.getContextStringForWidgets(List): string
	-- upvalues: TModule (copy)
	assert(TModule.array(TModule.string)(List))
	
	return (string.lower((string.gsub(string.gsub(table.concat(List, ":"), " ", "-"), "%.", "-"))))
end

function CatalogUtils.getContextForWidgetsById(Value, p5, p6)
	-- upvalues: TModule (copy), ConstantsModule1 (copy), CatalogUtils (copy)
	assert(TModule.tuple(TModule.string, TModule.string, TModule.optional(TModule.string))(Value, p5, p6), "Expected pageName to be a string, categoryId to be a string, and subcategoryId to be a string or nil")
	
	if not table.find(ConstantsModule1.ContextWidgetsAllowedRoutes, Value) then
		return nil
	end
	local AnalyticsContextEntry = ConstantsModule1.AnalyticsContext[Value]
	local CategoryNameById = CatalogUtils.getCategoryNameById(p5)
	
	if not AnalyticsContextEntry or not CategoryNameById then
		return nil
	end
	local List = { `{AnalyticsContextEntry}-tab` }
	table.insert(List, CategoryNameById)
	
	if p6 then
		local SubcategoryNameByIdWithErrorLogging = CatalogUtils.getSubcategoryNameByIdWithErrorLogging(p5, p6)
		
		if SubcategoryNameByIdWithErrorLogging then
			table.insert(List, SubcategoryNameByIdWithErrorLogging)
		end
		if p6 and not SubcategoryNameByIdWithErrorLogging then
			return nil
		end
	end
	return CatalogUtils.getContextStringForWidgets(List)
end

function CatalogUtils.getCategoryAndSubcategory(p5)
	-- upvalues: CatalogUtils (copy), SelectCurrentAvatarRouteFunction (copy), AvatarScreen (copy)
	local CurrentCategoryNames = CatalogUtils.getCurrentCategoryNames(p5)
	local SelectCurrentAvatarRouteResult = SelectCurrentAvatarRouteFunction(p5)
	local IsNameMatch: boolean = SelectCurrentAvatarRouteResult and SelectCurrentAvatarRouteResult.name == AvatarScreen.CatalogSearch
	local CatalogCategory = nil
	local CatalogSearchSubcategory = nil
	
	if CurrentCategoryNames then
		if IsNameMatch then
			CatalogCategory = CurrentCategoryNames.catalogSearchCategory or CatalogCategory
			CatalogSearchSubcategory = CurrentCategoryNames.catalogSearchSubcategory or CatalogSearchSubcategory
			
			return CatalogCategory, CatalogSearchSubcategory
		end
		CatalogCategory = CurrentCategoryNames.catalogCategory or CatalogCategory
		CatalogSearchSubcategory = CurrentCategoryNames.catalogSubcategory or CatalogSearchSubcategory
	end
	return CatalogCategory, CatalogSearchSubcategory
end

function CatalogUtils.removeItemFootersFromConfigs(p5, p6, p7, p8, p9)
	-- upvalues: TutilsModule (copy)
	local function _(List)
		-- upvalues: p7 (copy), p8 (copy), p9 (copy)
		local function removeEntryFromItemFooter(ContentType)
			-- upvalues: List (copy)
			local Index = nil
			
			for i, value in List do
				if value.contentType == ContentType then
					Index = i
				end
				if Index then
					table.remove(List, Index)
				end
			end
		end
		
		if p7 then
			removeEntryFromItemFooter("ItemName")
		end
		if p8 then
			removeEntryFromItemFooter("AgentName")
		end
		if p9 then
			removeEntryFromItemFooter("Price")
		end
	end
	
	local DeepCopyResult = TutilsModule.deepCopy(p5)
	local DeepCopyResult1 = TutilsModule.deepCopy(p6)
	
	if DeepCopyResult1 and DeepCopyResult1.template and DeepCopyResult1.template.itemFooters then
		local ItemFooters = DeepCopyResult1.template.itemFooters
		
		local function removeEntryFromItemFooter(ContentType)
			-- upvalues: ItemFooters (copy)
			local Index = nil
			
			for i, value in ItemFooters do
				if value.contentType == ContentType then
					Index = i
				end
				if Index then
					table.remove(ItemFooters, Index)
				end
			end
		end
		
		if p7 then
			removeEntryFromItemFooter("ItemName")
		end
		if p8 then
			removeEntryFromItemFooter("AgentName")
		end
		if p9 then
			removeEntryFromItemFooter("Price")
		end
	end
	if DeepCopyResult and DeepCopyResult.defaultItemGroupTemplate and DeepCopyResult.defaultItemGroupTemplate.itemFooters then
		local ItemFooters1 = DeepCopyResult.defaultItemGroupTemplate.itemFooters
		
		local function removeEntryFromItemFooter(ContentType)
			-- upvalues: ItemFooters1 (copy)
			local Index = nil
			
			for i, value in ItemFooters1 do
				if value.contentType == ContentType then
					Index = i
				end
				if Index then
					table.remove(ItemFooters1, Index)
				end
			end
		end
		
		if p7 then
			removeEntryFromItemFooter("ItemName")
		end
		if p8 then
			removeEntryFromItemFooter("AgentName")
		end
		if p9 then
			removeEntryFromItemFooter("Price")
		end
	end
	if DeepCopyResult and DeepCopyResult.defaultItemCarouselTemplate and DeepCopyResult.defaultItemCarouselTemplate.itemFooters then
		local ItemFooters2 = DeepCopyResult.defaultItemCarouselTemplate.itemFooters
		
		local function removeEntryFromItemFooter(ContentType)
			-- upvalues: ItemFooters2 (copy)
			local Index = nil
			
			for i, value in ItemFooters2 do
				if value.contentType == ContentType then
					Index = i
				end
				if Index then
					table.remove(ItemFooters2, Index)
				end
			end
		end
		
		if p7 then
			removeEntryFromItemFooter("ItemName")
		end
		if p8 then
			removeEntryFromItemFooter("AgentName")
		end
		if p9 then
			removeEntryFromItemFooter("Price")
		end
	end
	if DeepCopyResult and DeepCopyResult.customizedDataMap and DeepCopyResult.customizedDataMap.creatorNameTileFooterEnabled and p8 then
		DeepCopyResult.customizedDataMap.creatorNameTileFooterEnabled = false
	end
	return DeepCopyResult, DeepCopyResult1
end

function CatalogUtils.getAvatarsTabAnalyticsInfo(p10)
	-- upvalues: CatalogUtils (copy), AvatarScreen (copy)
	local CurrentCategoryNames = CatalogUtils.getCurrentCategoryNames(p10)
	local Name = p10.AvatarExperience.AvatarScene.AvatarRoute.opaque.name
	local Keyword = nil
	local SearchUuid = nil
	local CatalogSearchCategory = nil
	local CatalogSearchSubcategory = nil
	
	if Name == AvatarScreen.CatalogSearch then
		Keyword = p10.AvatarExperience.Catalog.AvatarsTabSearchInfo.keyword
		SearchUuid = p10.AvatarExperience.Catalog.AvatarsTabSearchInfo.searchUuid
		CatalogSearchCategory = CurrentCategoryNames and CurrentCategoryNames.catalogSearchCategory
		CatalogSearchSubcategory = CurrentCategoryNames and CurrentCategoryNames.catalogSearchSubcategory
	else
		CatalogSearchCategory = CurrentCategoryNames and CurrentCategoryNames.catalogCategory
		CatalogSearchSubcategory = CurrentCategoryNames and CurrentCategoryNames.catalogSubcategory
	end
	return Keyword, CatalogSearchCategory, CatalogSearchSubcategory, SearchUuid, Name
end

return CatalogUtils