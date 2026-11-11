local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local DashModule = require(CorePackages.Packages.Dash)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local AvatarToCatalogButtonModule = require(Modules.AvatarExperience.Catalog.Analytics.avatarToCatalogButton)
local CatalogOpenedFromLandingPageModule = require(Modules.AvatarExperience.Catalog.Analytics.catalogOpenedFromLandingPage)
local CatalogSearchModule = require(Modules.AvatarExperience.Catalog.Analytics.catalogSearch)
local ClickCustomizeAvatarFromItemDetailPageModule = require(Modules.AvatarExperience.Catalog.Analytics.clickCustomizeAvatarFromItemDetailPage)
local ClickNavigationTabModule = require(Modules.AvatarExperience.Catalog.Analytics.clickNavigationTab)
local ClickCatalogItemModule = require(Modules.AvatarExperience.Catalog.Analytics.clickCatalogItem)
local CloseItemDetailPageModule = require(Modules.AvatarExperience.Catalog.Analytics.closeItemDetailPage)
local ExpandItemDetailPageModule = require(Modules.AvatarExperience.Catalog.Analytics.expandItemDetailPage)
local MoreMenuToCatalogButtonModule = require(Modules.AvatarExperience.Catalog.Analytics.moreMenuToCatalogButton)
local PurchaseAssetModule = require(Modules.AvatarExperience.Catalog.Analytics.purchaseAsset)
local PurchaseBundleModule = require(Modules.AvatarExperience.Catalog.Analytics.purchaseBundle)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local _ = require(Modules.AvatarExperience.Common.Types)
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local UserInputService = game:GetService("UserInputService")
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AnalyticsService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local Constants = AvatarExperienceAnalyticsModule.Constants
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local Contexts = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts
local FFlagProfilePlatformEnableStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagAXFixPurchaseSurfaceLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixPurchaseSurfaceLogging
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local config = {
	[AvatarScreen.Catalog] = ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE,
	[AvatarScreen.CatalogSearch] = ImpressionEnums.MarketplaceSurfaceType.SEARCH,
	[AvatarScreen.ItemDetails] = ImpressionEnums.MarketplaceSurfaceType.ITEM_DETAIL,
	[AvatarScreen.AvatarEditor] = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
	[AvatarScreen.MySharedAvatars] = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
	[AvatarScreen.ProfilePictureEditorEmotes] = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
	[Contexts.CommunityProfile] = ImpressionEnums.MarketplaceSurfaceType.COMMUNITY_PROFILE,
	[Contexts.PlayerProfile] = ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE
}
local config1 = {
	[require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).Components.CurrentlyWearing] = ImpressionEnums.RecommendationSurfaceType.CURRENTLY_WEARING
}
local v1 = nil

local function _(p1)
	-- upvalues: CatalogUtilsModule (copy)
	return (if p1 then CatalogUtilsModule.getCategoryNameById(p1) else nil) or ""
end

local _ = function(p1, p2)
	-- upvalues: CatalogUtilsModule (copy)
	return (if p1 and p2 then CatalogUtilsModule.getSubcategoryNameById(p1, p2) else nil) or ""
end

local function getAXCounterV2Metadata(p1)
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	local AssignResult = {
		AppVersion = RunService:GetRobloxVersion(),
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion(),
		Platform = if IsSpatialFunction() then "VR" else UserInputService:GetPlatform()
	}
	
	if p1 and next(p1) ~= nil then
		AssignResult = DashModule.assign({}, AssignResult, p1)
	end
	return AssignResult
end

return {
	get = function(_)
		-- upvalues: v1 (ref), AnalyticsService (copy), CatalogUtilsModule (copy), ClickCatalogItemModule (copy), ConstantsModule (copy), FFlagProfilePlatformEnableStore (copy), OrganicEventImpressionsSchema (copy), ImpressionEnums (copy), config (copy), config1 (copy), PurchaseAssetModule (copy), ReportAvatarEventCounterV1Function (copy), Constants (copy), PurchaseBundleModule (copy), ConstantsModule1 (copy), getAXCounterV2Metadata (copy), Default (copy), ClickNavigationTabModule (copy), CatalogSearchModule (copy), ClickCustomizeAvatarFromItemDetailPageModule (copy), CloseItemDetailPageModule (copy), ExpandItemDetailPageModule (copy), AvatarToCatalogButtonModule (copy), MoreMenuToCatalogButtonModule (copy), CatalogOpenedFromLandingPageModule (copy), FFlagAXFixPurchaseSurfaceLogging (copy), RbxAnalyticsService (copy), CatalogConstantsModule (copy), WidgetConstants (copy)
		if v1 then
			return v1
		else
			local config2 = {
				clickCatalogItem = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
					-- upvalues: CatalogUtilsModule (upval), ClickCatalogItemModule (upval), AnalyticsService (copy)
					ClickCatalogItemModule(AnalyticsService.EventStream, p1, p2, (if p3 then CatalogUtilsModule.getCategoryNameById(p3) else nil) or "", (if p3 and p4 then CatalogUtilsModule.getSubcategoryNameById(p3, p4) else nil) or "", p5, p6, p7, p8, p9, p10, p11, p12, p13)
				end,
				clickCatalogItemFromProfile = function(p1, ItemID, ItemType, p2, AbsPositions, _)
					-- upvalues: ConstantsModule (upval), FFlagProfilePlatformEnableStore (upval), OrganicEventImpressionsSchema (upval), ImpressionEnums (upval), config (upval), config1 (upval), AnalyticsService (copy)
					local config2 = {
						page = "playerProfile",
						feature = ConstantsModule.ProfileAnalyticsTag,
						itemID = ItemID,
						itemType = ItemType,
						subpage = if FFlagProfilePlatformEnableStore then p2 else "peekView"
					}
					local EnumMap = OrganicEventImpressionsSchema.defaultItem.enumMap
					AnalyticsService.EventStream:sendTelemetryEvent(p1, "marketplaceOrganicFELog", {
						price = 0,
						itemId = ItemID,
						actionType = ImpressionEnums.ActionType.CLICK_ITEM_DETAIL,
						contentType = if EnumMap and EnumMap.contentType then EnumMap.contentType[ItemType] else nil,
						surface = config[p1],
						recommendationSurface = config1[p2],
						absPositions = AbsPositions
					})
					AnalyticsService.EventStream:sendTelemetryEvent(p1, "itemDetailReferral", config2)
				end,
				purchaseAsset = function(p1, p2, p3, p4, p5, p6)
					-- upvalues: PurchaseAssetModule (upval), AnalyticsService (copy), ReportAvatarEventCounterV1Function (upval), Constants (upval)
					PurchaseAssetModule(AnalyticsService.EventStream, "purchaseAsset", p1, p2, p3, p4, p5, p6)
					ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset)
				end,
				purchaseBundle = function(p1, p2, p3, p4, p5)
					-- upvalues: PurchaseBundleModule (upval), AnalyticsService (copy), ReportAvatarEventCounterV1Function (upval), Constants (upval)
					PurchaseBundleModule(AnalyticsService.EventStream, "purchaseBundle", p1, p2, p3, p4, p5)
					ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle)
				end,
				homepageWidgetItemClick = function(Item_id, Item_type)
					-- upvalues: ImpressionEnums (upval), AnalyticsService (copy)
					AnalyticsService.EventStream:sendTelemetryEvent("HomeTryOnScreen", "marketplaceOrganicFELog", {
						group = "HomePageAvatarWidgetClick",
						actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
						surface = ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE,
						item_id = Item_id,
						item_type = Item_type,
						event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
					})
				end,
				sendCounter = function(p1)
					-- upvalues: ReportAvatarEventCounterV1Function (upval)
					ReportAvatarEventCounterV1Function(p1)
				end
			}
			
			function config2.sendAXCounter(Text, p1, p2)
				-- upvalues: ReportAvatarEventCounterV1Function (upval), ConstantsModule1 (upval), config2 (copy)
				ReportAvatarEventCounterV1Function(ConstantsModule1.Counter.PREFIX .. Text)
				
				if p1 then
					config2.sendAXCounterV2(Text, p2)
				end
			end
			
			function config2.sendAXCounterV2(Text, p1)
				-- upvalues: ConstantsModule (upval), getAXCounterV2Metadata (upval), Default (upval)
				Default:logRobloxTelemetryCounter({
					description = "Counter to track various Avatar Experience events.",
					links = "https://roblox.atlassian.net/wiki/spaces/AMSD/pages/2800779286/Tech+Spec+-+Q3+Grafana+Dashboard+Improvements",
					eventName = ConstantsModule.Counter.PREFIX .. Text,
					backends = { "RobloxTelemetryCounter" },
					lastUpdated = { 2024, 4, 30 }
				}, 1, (getAXCounterV2Metadata(p1)))
			end
			
			function config2.sendAXStat(Text, p1, p2)
				-- upvalues: getAXCounterV2Metadata (upval), Default (upval)
				Default:logRobloxTelemetryStat({
					description = "Stat to track various Avatar Experience events.",
					links = "https://roblox.atlassian.net/wiki/spaces/AMSD/pages/2800779286/Tech+Spec+-+Q3+Grafana+Dashboard+Improvements",
					eventName = "AXStat_" .. Text,
					backends = { "RobloxTelemetryStat" },
					lastUpdated = { 2024, 4, 30 }
				}, p1, (getAXCounterV2Metadata(p2)))
			end
			
			function config2.clickNavigationTab(p1, p2)
				-- upvalues: CatalogUtilsModule (upval), ClickNavigationTabModule (upval), AnalyticsService (copy)
				ClickNavigationTabModule(AnalyticsService.EventStream, "clickNavigationTab", (if p1 then CatalogUtilsModule.getCategoryNameById(p1) else nil) or "", (if p1 and p2 then CatalogUtilsModule.getSubcategoryNameById(p1, p2) else nil) or "")
			end
			
			function config2.catalogSearch(p1, p2, p3, p4, p5, p6)
				-- upvalues: CatalogSearchModule (upval), AnalyticsService (copy)
				CatalogSearchModule(AnalyticsService.EventStream, p1, p2, p6, p3, p4, p5)
			end
			
			function config2.clickCustomizeAvatarFromItemDetailPage()
				-- upvalues: ClickCustomizeAvatarFromItemDetailPageModule (upval), AnalyticsService (copy)
				ClickCustomizeAvatarFromItemDetailPageModule(AnalyticsService.EventStream, "clickCustomizeAvatarFromItemDetailPage")
			end
			
			function config2.closeItemDetailPage(p1, p2)
				-- upvalues: CloseItemDetailPageModule (upval), AnalyticsService (copy)
				CloseItemDetailPageModule(AnalyticsService.EventStream, "closeItemDetailPage", p1, p2)
			end
			
			function config2.expandItemDetailPage(p1, p2)
				-- upvalues: ExpandItemDetailPageModule (upval), AnalyticsService (copy)
				ExpandItemDetailPageModule(AnalyticsService.EventStream, "expandItemDetailPage", p1, p2)
			end
			
			function config2.avatarToCatalogButton()
				-- upvalues: AvatarToCatalogButtonModule (upval), AnalyticsService (copy)
				AvatarToCatalogButtonModule(AnalyticsService.EventStream, "avatarToCatalogButton")
			end
			
			function config2.moreMenuToCatalogButton()
				-- upvalues: MoreMenuToCatalogButtonModule (upval), AnalyticsService (copy)
				MoreMenuToCatalogButtonModule(AnalyticsService.EventStream, "moreMenuToCatalogButton")
			end
			
			function config2.catalogOpenedFromLandingPage()
				-- upvalues: CatalogOpenedFromLandingPageModule (upval), AnalyticsService (copy)
				CatalogOpenedFromLandingPageModule(AnalyticsService.EventStream, "catalogOpenedFromLandingPage")
			end
			
			function config2.clickPurchaseItemButton(ItemID, ItemType, p1, FromScreen, RequestId, Keyword, p2, p3, p4, p5)
				-- upvalues: OrganicEventImpressionsSchema (upval), ConstantsModule (upval), ImpressionEnums (upval), FFlagAXFixPurchaseSurfaceLogging (upval), config (upval), AnalyticsService (copy), RbxAnalyticsService (upval)
				local EnumMap = OrganicEventImpressionsSchema.defaultItem.enumMap
				local ContentTypeEntry = if EnumMap and EnumMap.contentType then EnumMap.contentType[ItemType] else nil
				local AnalyticsTag = ConstantsModule.AnalyticsTag
				local Page: string? = nil
				local Subpage: string? = nil
				
				if p1 then
					AnalyticsTag = ConstantsModule.ProfileAnalyticsTag
					Page = "playerProfile"
					Subpage = "peekView"
				elseif p4 then
					AnalyticsTag = ConstantsModule.ContentFeedAnalyticsTag
					Page = "contentFeed"
				end
				local config1 = {
					btn = "PriceButton",
					feature = AnalyticsTag,
					itemID = ItemID,
					itemType = ItemType,
					subpage = Subpage,
					page = Page,
					fromScreen = FromScreen
				}
				AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "marketplaceOrganicFELog", {
					btn = "PriceButton",
					feature = AnalyticsTag,
					itemId = ItemID,
					actionType = ImpressionEnums.ActionType.PURCHASE_ATTEMPT,
					contentType = ContentTypeEntry,
					requestId = RequestId,
					subpage = Subpage,
					page = Page,
					keyword = Keyword,
					surface = FFlagAXFixPurchaseSurfaceLogging and p5 or config[FromScreen],
					sort = p3.sortEnumValue,
					filterSalesType = p3.filterSalesTypeEnumValue,
					filterCreators = p3.filterCreatorsTypeEnumValue,
					filterPrice = p3.filterPriceEnumValue,
					filterUnavailableItems = p3.filterUnavailableItemsEnumValue,
					filterCreatorsName = p3.filterCreatorsName,
					filterPriceMin = p3.filterPriceMin,
					filterPriceMax = p3.filterPriceMax
				})
				AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", config1)
				
				if p2 then
					AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClickHasAccessoryAdjustment", {
						btn = "PriceButton",
						feature = AnalyticsTag,
						itemID = ItemID,
						itemType = ItemType,
						subpage = Subpage,
						page = Page,
						fromScreen = FromScreen,
						refineSessionId = RbxAnalyticsService:GetSessionId()
					})
				end
			end
			
			function config2.shownEnableTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth)
			end
			
			function config2.shownTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth)
			end
			
			function config2.failedShowTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth)
			end
			
			function config2.completedTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth)
			end
			
			function config2.invalidatedTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth)
			end
			
			function config2.abandonedTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth)
			end
			
			function config2.loadFailedTwoStepAuthOnPurchase()
				-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth)
			end
			
			function config2.clickCustomizeItemButton(ItemID, ItemType)
				-- upvalues: ConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", {
					btn = "Customize",
					cstm = "Shop",
					feature = ConstantsModule.AnalyticsTag,
					itemID = ItemID,
					itemType = ItemType
				})
			end
			
			function config2.clickFavoriteItemButton(ItemID, ItemType, Checked)
				-- upvalues: ConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", {
					btn = "Favorite",
					cstm = "Shop",
					feature = ConstantsModule.AnalyticsTag,
					itemID = ItemID,
					itemType = ItemType,
					checked = Checked
				})
			end
			
			function config2.clickShareItemButton(ItemID, ItemType)
				-- upvalues: ConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", {
					btn = "Share",
					cstm = "Shop",
					feature = ConstantsModule.AnalyticsTag,
					itemID = ItemID,
					itemType = ItemType
				})
			end
			
			function config2.applySortAndFilters(p1)
				-- upvalues: ConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("SortAndFilters", "buttonClick", {
					btn = "Apply",
					feature = ConstantsModule.AnalyticsTag,
					minPrice = p1.minPrice,
					maxPrice = p1.maxPrice,
					sortType = p1.sortType,
					sortAggregation = p1.sortAggregation,
					salesTypeFilter = p1.salesTypeFilter,
					creatorFilter = p1.creatorFilter,
					includeOffSale = p1.includeOffSale
				})
			end
			
			function config2.applyPriceFilter(PriceLowerBound, PriceUpperBound)
				-- upvalues: ConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("PriceFilter", "buttonClick", {
					btn = "Apply",
					feature = ConstantsModule.AnalyticsTag,
					PriceLowerBound = PriceLowerBound,
					PriceUpperBound = PriceUpperBound
				})
			end
			
			function config2.navigateToProfile(Text)
				-- upvalues: ReportAvatarEventCounterV1Function (upval), ConstantsModule (upval), AnalyticsService (copy)
				ReportAvatarEventCounterV1Function(Text .. "LuaProfile")
				AnalyticsService.EventStream:sendTelemetryEvent(Text, "buttonClick", {
					btn = "creator",
					subpage = "peekView",
					page = "playerProfile",
					feature = ConstantsModule.ProfileAnalyticsTag
				})
			end
			
			function config2.selectTopic(Topic, Rank, p1, p2, Query, List, List1)
				-- upvalues: CatalogConstantsModule (upval), CatalogUtilsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent(CatalogConstantsModule.AnalyticsContext.Catalog, "selectCatalogTopic", {
					topic = Topic,
					allTopics = if List then table.concat(List, ",") else nil,
					previousSelectedTopics = if List1 then table.concat(List1, ",") else nil,
					rank = Rank,
					category = (if p1 then CatalogUtilsModule.getCategoryNameById(p1) else nil) or "",
					subcategory = (if p1 and p2 then CatalogUtilsModule.getSubcategoryNameById(p1, p2) else nil) or "",
					query = Query
				})
			end
			
			function config2.openItemDetails(AssetId, AssetType, Price, EntryPoint)
				-- upvalues: CatalogConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent(CatalogConstantsModule.AnalyticsContext.AvatarShop, "openItemDetails", {
					assetId = AssetId,
					assetType = AssetType,
					price = Price,
					entryPoint = EntryPoint
				})
			end
			
			function config2.openItemDetailsV2(ItemId, p1, Price, p2, RequestId, Keyword, Category, Subcategory, p3)
				-- upvalues: CatalogConstantsModule (upval), OrganicEventImpressionsSchema (upval), ImpressionEnums (upval), config (upval), AnalyticsService (copy)
				local EnumMap = OrganicEventImpressionsSchema.defaultItem.enumMap
				AnalyticsService.EventStream:sendTelemetryEvent(CatalogConstantsModule.AnalyticsContext.AvatarShop, "marketplaceOrganicFELog", {
					itemId = ItemId,
					actionType = ImpressionEnums.ActionType.CLICK_ITEM_DETAIL,
					contentType = if EnumMap and EnumMap.contentType then EnumMap.contentType[p1] else nil,
					price = Price,
					surface = config[p2],
					requestId = RequestId,
					absPositions = p3.selectedItemIndex,
					keyword = Keyword,
					category = Category,
					subcategory = Subcategory,
					sort = p3.sortEnumValue,
					filterSalesType = p3.filterSalesTypeEnumValue,
					filterCreators = p3.filterCreatorsTypeEnumValue,
					filterPrice = p3.filterPriceEnumValue,
					filterUnavailableItems = p3.filterUnavailableItemsEnumValue,
					filterCreatorsName = p3.filterCreatorsName,
					filterPriceMin = p3.filterPriceMin,
					filterPriceMax = p3.filterPriceMax
				})
			end
			
			function config2.resizeOutfitScreen(StateChange)
				-- upvalues: CatalogConstantsModule (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent(CatalogConstantsModule.AnalyticsContext.AvatarShop, "openOutfitScreen", { stateChange = StateChange })
			end
			
			function config2.avatarShopBuyItem(ItemId, p1, Price, p2, RequestId, Keyword, Category, Subcategory, p3, p4)
				-- upvalues: CatalogConstantsModule (upval), OrganicEventImpressionsSchema (upval), AnalyticsService (copy), ImpressionEnums (upval), FFlagAXFixPurchaseSurfaceLogging (upval), config (upval)
				local EnumMap = OrganicEventImpressionsSchema.defaultItem.enumMap
				AnalyticsService.EventStream:sendEventImmediately(CatalogConstantsModule.AnalyticsContext.AvatarShop, "marketplaceOrganicFELog", {
					itemId = ItemId,
					actionType = ImpressionEnums.ActionType.PURCHASE_SUCCESS,
					contentType = if EnumMap and EnumMap.contentType then EnumMap.contentType[p1] else nil,
					price = Price,
					surface = FFlagAXFixPurchaseSurfaceLogging and p4 or config[p2],
					requestId = RequestId,
					absPositions = p3.selectedItemIndex,
					sort = p3.sortEnumValue,
					filterSalesType = p3.filterSalesTypeEnumValue,
					filterCreators = p3.filterCreatorsTypeEnumValue,
					filterPrice = p3.filterPriceEnumValue,
					filterUnavailableItems = p3.filterUnavailableItemsEnumValue,
					filterCreatorsName = p3.filterCreatorsName,
					filterPriceMin = p3.filterPriceMin,
					filterPriceMax = p3.filterPriceMax,
					keyword = Keyword,
					category = Category,
					subcategory = Subcategory
				})
			end
			
			function config2.widgetInteraction(Request_id, Action_type, Item_position, Widget_position, Item_id, Item_type, Widget_id)
				-- upvalues: AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("catalog", "widgetApiFELog", {
					request_id = Request_id,
					action_type = Action_type,
					item_position = Item_position,
					widget_position = Widget_position,
					item_id = Item_id,
					item_type = Item_type,
					widget_id = Widget_id
				})
			end
			
			function config2.widgetInteractionV2(p1, Action_type)
				-- upvalues: WidgetConstants (upval), AnalyticsService (copy)
				local config = { Outfit = "1", Avatar = "2", Makeup = "3" }
				local config1 = {
					action_type = Action_type,
					request_id = p1.requestId,
					item_position = p1.itemPosition,
					widget_position = p1.widgetPosition,
					item_id = p1.itemId,
					item_type = p1.itemType,
					look_type = if p1.lookType then config[p1.lookType] else nil,
					widget_id = p1.widgetId,
					widget_type = p1.widgetType,
					widget_abs_position = p1.widgetAbsPosition,
					widget_item_ids = if p1.widgetItemIds then table.concat(p1.widgetItemIds, ",") else nil,
					kwd = p1.query,
					organic_result_ids = if p1.organicResultIds then table.concat(p1.organicResultIds, ",") else nil,
					time_spent_sec = p1.timeSpentSec,
					asset_ids = if p1.assetIds then table.concat(p1.assetIds, ",") else nil,
					bundle_ids = if p1.bundleIds then table.concat(p1.bundleIds, ",") else nil,
					total_robux = p1.totalRobux,
					ui_treatment_type = p1.uiTreatmentType
				}
				
				if Action_type == WidgetConstants.ActionType.PURCHASE_SUCCESS then
					AnalyticsService.EventStream:sendEventImmediately("catalog", "widgetApiFELog", config1)
					
					return
				else
					AnalyticsService.EventStream:sendTelemetryEvent("catalog", "widgetApiFELog", config1)
				end
			end
			
			v1 = config2
			
			return config2
		end
	end
}