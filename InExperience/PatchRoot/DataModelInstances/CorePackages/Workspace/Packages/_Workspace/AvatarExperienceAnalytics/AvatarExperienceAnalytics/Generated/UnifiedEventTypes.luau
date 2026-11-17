local UnifiedEventEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.UnifiedEventEnums)
local PayloadKeyChecks = {
	action = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceUnifiedAction
	},
	assetIds = { luauType = "string" },
	assetType = { toEnum = UnifiedEventEnumsModule.toAssetType },
	bundleIds = { luauType = "string" },
	bundleType = { toEnum = UnifiedEventEnumsModule.toMarketplaceBundleType },
	cartId = { luauType = "string" },
	category = { luauType = "string" },
	categoryGroup = { luauType = "string" },
	categoryId = { luauType = "number" },
	categoryName = { luauType = "string" },
	categoryType = { luauType = "string" },
	deviceTier = { luauType = "string" },
	elementCoordinatesX = { luauType = "number" },
	elementCoordinatesY = { luauType = "number" },
	elementMetadata = { luauType = "string" },
	elementName = { luauType = "string" },
	elementRelativePositionX = { luauType = "number" },
	elementRelativePositionY = { luauType = "number" },
	elementSessionTag = { luauType = "string" },
	elementSizeHeight = { luauType = "number" },
	elementSizeWidth = { luauType = "number" },
	filterCreators = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceFiltersCreators
	},
	filterCreatorsName = { luauType = "string" },
	filterPrice = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceFiltersPrice
	},
	filterPriceMax = { luauType = "string" },
	filterPriceMin = { luauType = "string" },
	filterSalesType = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceFiltersSalesType
	},
	filterUnavailableItems = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceFiltersUnavailableItems
	},
	gridPositionColumn = { luauType = "number" },
	gridPositionRow = { luauType = "number" },
	isOwnedItem = { luauType = "boolean" },
	itemId = { luauType = "string" },
	itemPosition = { luauType = "number" },
	itemType = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceUnifiedItemType
	},
	keyword = { luauType = "string" },
	navigationOpaquePage = { luauType = "string" },
	navigationPage = { luauType = "string" },
	organicAssetIds = { luauType = "string" },
	organicBundleIds = { luauType = "string" },
	organicItemPrice = { luauType = "number" },
	organicItemSaveToMyAvatars = { luauType = "boolean" },
	organicItemWearAfterPurchase = { luauType = "boolean" },
	organicLookContainsTimedOptions = { luauType = "boolean" },
	organicLookType = { toEnum = UnifiedEventEnumsModule.toMarketplaceLookType },
	organicResultIds = { luauType = "string" },
	organicTimedOption = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceTimedOption
	},
	requestId = { luauType = "string" },
	screenSizeHeight = { luauType = "number" },
	screenSizeWidth = { luauType = "number" },
	section = { luauType = "string" },
	selectedItemIndex = { luauType = "number" },
	sessionTag = { luauType = "string" },
	sort = { toEnum = UnifiedEventEnumsModule.toMarketplaceSorts },
	stableCategoryId = { luauType = "string" },
	subcategory = { luauType = "string" },
	surface = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceUnifiedSurface
	},
	targetId = { luauType = "number" },
	taxonomyId = { luauType = "string" },
	themeId = { luauType = "string" },
	uiTreatmentType = { toEnum = UnifiedEventEnumsModule.toWidgetUiTreatment },
	universeId = { luauType = "number" },
	widgetAbsPosition = { luauType = "number" },
	widgetAssetType = { toEnum = UnifiedEventEnumsModule.toAssetType },
	widgetBundleType = { toEnum = UnifiedEventEnumsModule.toMarketplaceBundleType },
	widgetId = { luauType = "string" },
	widgetItemIds = { luauType = "string" },
	widgetItemPrice = { luauType = "number" },
	widgetItemSaveToMyAvatars = { luauType = "boolean" },
	widgetItemWearAfterPurchase = { luauType = "boolean" },
	widgetLookContainsTimedOptions = { luauType = "boolean" },
	widgetLookType = { toEnum = UnifiedEventEnumsModule.toMarketplaceLookType },
	widgetPosition = { luauType = "number" },
	widgetTimedOption = {
		toEnum = UnifiedEventEnumsModule.toMarketplaceTimedOption
	},
	widgetType = { luauType = "string" }
}
table.freeze(PayloadKeyChecks)
local PayloadShapes = {
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_VIEW,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_EXIT
		},
		required = { "surface" },
		forbidden = {
			"assetIds", "bundleIds", "organicResultIds", "themeId", "uiTreatmentType",
			"widgetAbsPosition", "widgetAssetType", "widgetBundleType", "widgetId",
			"widgetItemIds", "widgetItemPrice", "widgetItemSaveToMyAvatars",
			"widgetItemWearAfterPurchase", "widgetLookContainsTimedOptions",
			"widgetLookType", "widgetPosition", "widgetTimedOption", "widgetType"
		},
		anyOf = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED
		},
		required = {
			"elementSizeHeight", "elementSizeWidth", "gridPositionColumn",
			"gridPositionRow", "itemId", "itemType", "screenSizeHeight", "screenSizeWidth",
			"surface"
		},
		forbidden = {
			"assetIds", "bundleIds", "organicResultIds", "themeId", "uiTreatmentType",
			"widgetAbsPosition", "widgetAssetType", "widgetBundleType", "widgetId",
			"widgetItemIds", "widgetItemPrice", "widgetItemSaveToMyAvatars",
			"widgetItemWearAfterPurchase", "widgetLookContainsTimedOptions",
			"widgetLookType", "widgetPosition", "widgetTimedOption", "widgetType"
		},
		anyOf = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS
		},
		required = { "itemId", "itemType", "surface" },
		forbidden = {
			"assetIds", "bundleIds", "organicResultIds", "themeId", "uiTreatmentType",
			"widgetAbsPosition", "widgetAssetType", "widgetBundleType", "widgetId",
			"widgetItemIds", "widgetItemPrice", "widgetItemSaveToMyAvatars",
			"widgetItemWearAfterPurchase", "widgetLookContainsTimedOptions",
			"widgetLookType", "widgetPosition", "widgetTimedOption", "widgetType"
		},
		anyOf = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED
		},
		required = { "gridPositionColumn", "gridPositionRow" },
		forbidden = {
			"assetIds", "bundleIds", "organicResultIds", "themeId", "uiTreatmentType",
			"widgetAbsPosition", "widgetAssetType", "widgetBundleType", "widgetId",
			"widgetItemIds", "widgetItemPrice", "widgetItemSaveToMyAvatars",
			"widgetItemWearAfterPurchase", "widgetLookContainsTimedOptions",
			"widgetLookType", "widgetPosition", "widgetTimedOption", "widgetType"
		},
		anyOf = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_VIEW,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_EXIT
		},
		required = {
			"requestId", "surface", "uiTreatmentType", "widgetId", "widgetItemIds",
			"widgetType"
		},
		forbidden = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED
		},
		required = {
			"elementSizeHeight", "elementSizeWidth", "gridPositionColumn",
			"gridPositionRow", "itemId", "itemType", "requestId", "screenSizeHeight",
			"screenSizeWidth", "surface", "uiTreatmentType", "widgetId", "widgetItemIds",
			"widgetType"
		},
		forbidden = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS
		},
		required = {
			"itemId", "itemType", "requestId", "surface", "uiTreatmentType", "widgetId",
			"widgetItemIds", "widgetType"
		},
		forbidden = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED
		},
		required = {
			"gridPositionColumn", "gridPositionRow", "requestId", "widgetId",
			"widgetItemIds", "widgetType"
		},
		forbidden = {
			"assetType", "bundleType", "isOwnedItem", "organicAssetIds",
			"organicBundleIds", "organicItemPrice", "organicItemSaveToMyAvatars",
			"organicItemWearAfterPurchase", "organicLookContainsTimedOptions",
			"organicLookType", "organicTimedOption"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_VIEW,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PAGE_EXIT
		},
		required = { "elementName", "surface" },
		forbidden = {
			"assetIds", "assetType", "bundleIds", "bundleType", "isOwnedItem",
			"organicAssetIds", "organicBundleIds", "organicItemPrice",
			"organicItemSaveToMyAvatars", "organicItemWearAfterPurchase",
			"organicLookContainsTimedOptions", "organicLookType", "organicResultIds",
			"organicTimedOption", "themeId", "uiTreatmentType", "widgetAbsPosition",
			"widgetAssetType", "widgetBundleType", "widgetId", "widgetItemIds",
			"widgetItemPrice", "widgetItemSaveToMyAvatars", "widgetItemWearAfterPurchase",
			"widgetLookContainsTimedOptions", "widgetLookType", "widgetPosition",
			"widgetTimedOption", "widgetType"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED
		},
		required = {
			"elementName", "elementSizeHeight", "elementSizeWidth", "gridPositionColumn",
			"gridPositionRow", "itemId", "itemType", "screenSizeHeight", "screenSizeWidth",
			"surface"
		},
		forbidden = {
			"assetIds", "assetType", "bundleIds", "bundleType", "isOwnedItem",
			"organicAssetIds", "organicBundleIds", "organicItemPrice",
			"organicItemSaveToMyAvatars", "organicItemWearAfterPurchase",
			"organicLookContainsTimedOptions", "organicLookType", "organicResultIds",
			"organicTimedOption", "themeId", "uiTreatmentType", "widgetAbsPosition",
			"widgetAssetType", "widgetBundleType", "widgetId", "widgetItemIds",
			"widgetItemPrice", "widgetItemSaveToMyAvatars", "widgetItemWearAfterPurchase",
			"widgetLookContainsTimedOptions", "widgetLookType", "widgetPosition",
			"widgetTimedOption", "widgetType"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS
		},
		required = { "elementName", "itemId", "itemType", "surface" },
		forbidden = {
			"assetIds", "assetType", "bundleIds", "bundleType", "isOwnedItem",
			"organicAssetIds", "organicBundleIds", "organicItemPrice",
			"organicItemSaveToMyAvatars", "organicItemWearAfterPurchase",
			"organicLookContainsTimedOptions", "organicLookType", "organicResultIds",
			"organicTimedOption", "themeId", "uiTreatmentType", "widgetAbsPosition",
			"widgetAssetType", "widgetBundleType", "widgetId", "widgetItemIds",
			"widgetItemPrice", "widgetItemSaveToMyAvatars", "widgetItemWearAfterPurchase",
			"widgetLookContainsTimedOptions", "widgetLookType", "widgetPosition",
			"widgetTimedOption", "widgetType"
		}
	},
	{
		actions = {
			UnifiedEventEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED
		},
		required = { "elementName", "gridPositionColumn", "gridPositionRow" },
		forbidden = {
			"assetIds", "assetType", "bundleIds", "bundleType", "isOwnedItem",
			"organicAssetIds", "organicBundleIds", "organicItemPrice",
			"organicItemSaveToMyAvatars", "organicItemWearAfterPurchase",
			"organicLookContainsTimedOptions", "organicLookType", "organicResultIds",
			"organicTimedOption", "themeId", "uiTreatmentType", "widgetAbsPosition",
			"widgetAssetType", "widgetBundleType", "widgetId", "widgetItemIds",
			"widgetItemPrice", "widgetItemSaveToMyAvatars", "widgetItemWearAfterPurchase",
			"widgetLookContainsTimedOptions", "widgetLookType", "widgetPosition",
			"widgetTimedOption", "widgetType"
		}
	}
}
table.freeze(PayloadShapes)
local PassthroughSurfaces = {
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.COMMUNITY_PROFILE] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.USER_PROFILE] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.DISCOVERY_HOMEPAGE] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.DISCOVERY_SEARCH_RESULTS] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.EDP_PREVIEW] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.EDP_STORE] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.IN_EXPERIENCE_SHOP_HOME] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.IN_EXPERIENCE_SHOP_DETAILS] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.IN_EXPERIENCE_SHOP_SEARCH] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.EDIT_PROFILE_IMAGE] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.BACKGROUND_GENERATION] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.SUPPORT_PANE_AVATAR_OVERLAY] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.PHOTOBOOTH_MOMENTS] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.SHOP_AVATAR_MOMENT] = true,
	[UnifiedEventEnumsModule.MarketplaceUnifiedSurface.IN_EXPERIENCE_NOTIFICATIONS] = true
}
table.freeze(PassthroughSurfaces)

return table.freeze({
	MarketplaceUnifiedAction = UnifiedEventEnumsModule.MarketplaceUnifiedAction,
	MarketplaceUnifiedActionNumbers = UnifiedEventEnumsModule.MarketplaceUnifiedActionNumbers,
	PassthroughSurfaces = PassthroughSurfaces,
	PayloadKeyChecks = PayloadKeyChecks,
	PayloadShapes = PayloadShapes
})