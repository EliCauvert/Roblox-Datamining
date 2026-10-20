local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums

return function(p1, p2, Page, Nav, SubNav, Sort, Input, AbsPositions, ItemID, ItemType, ItemSubType, p3, RequestId, p4)
	-- upvalues: ArgCheckModule (copy), HttpService (copy), OrganicEventImpressionsSchema (copy), ConstantsModule (copy), ImpressionEnums (copy)
	ArgCheckModule.isType(p2, "string", "openItemDetailPage event expects eventContext")
	ArgCheckModule.isType(Page, "number", "openItemDetailPage event expects pageNumber")
	ArgCheckModule.isType(Nav, "string", "openItemDetailPage event expects categoryName")
	ArgCheckModule.isType(SubNav, "string", "openItemDetailPage event expects subCategoryName")
	ArgCheckModule.isTypeOrNil(Sort, "string", "openItemDetailPage event expects sortType")
	ArgCheckModule.isTypeOrNil(Input, "table", "openItemDetailPage event expects filters")
	ArgCheckModule.isType(AbsPositions, "number", "openItemDetailPage event expects rank")
	ArgCheckModule.isType(ItemID, "string", "openItemDetailPage event expects itemId")
	ArgCheckModule.isType(ItemType, "string", "openItemDetailPage event expects itemType")
	ArgCheckModule.isTypeOrNil(ItemSubType, "string", "openItemDetailPage event expects itemSubType")
	ArgCheckModule.isTypeOrNil(p3, "boolean", "openItemDetailPage event expects fromProfile")
	ArgCheckModule.isTypeOrNil(RequestId, "string", "openItemDetailPage event expects requestId")
	local Json = Input and HttpService:JSONEncode(Input)
	local EnumMap = OrganicEventImpressionsSchema.defaultItem.enumMap
	local ContentTypeEntry = if EnumMap and EnumMap.contentType then EnumMap.contentType[ItemType] else nil
	p1:sendTelemetryEvent(p2, "marketplaceOrganicFELog", {
		feature = p3 and ConstantsModule.ProfileAnalyticsTag or ConstantsModule.AnalyticsTag,
		page = Page,
		actionType = ImpressionEnums.ActionType.ITEM_CLICK,
		requestId = RequestId,
		nav = Nav,
		subNav = SubNav,
		sort = p4.sortEnumValue,
		absPositions = AbsPositions,
		itemId = ItemID,
		contentType = ContentTypeEntry,
		assetType = if ContentTypeEntry == ImpressionEnums.MarketplaceItemType.ASSET then ItemSubType else nil,
		bundleType = if ContentTypeEntry == ImpressionEnums.MarketplaceItemType.BUNDLE then ItemSubType else nil,
		keyword = Input.keyword,
		category = Nav,
		subcategory = SubNav,
		filterSalesType = p4.filterSalesTypeEnumValue,
		filterCreators = p4.filterCreatorsTypeEnumValue,
		filterPrice = p4.filterPriceEnumValue,
		filterUnavailableItems = p4.filterUnavailableItemsEnumValue,
		filterCreatorsName = p4.filterCreatorsName,
		filterPriceMin = p4.filterPriceMin,
		filterPriceMax = p4.filterPriceMax
	})
	p1:sendTelemetryEvent(p2, "itemDetailReferral", {
		feature = p3 and ConstantsModule.ProfileAnalyticsTag or ConstantsModule.AnalyticsTag,
		page = Page,
		nav = Nav,
		subNav = SubNav,
		sort = Sort,
		filters = Json,
		rank = AbsPositions,
		itemID = ItemID,
		itemType = ItemType,
		itemSubType = ItemSubType
	})
end