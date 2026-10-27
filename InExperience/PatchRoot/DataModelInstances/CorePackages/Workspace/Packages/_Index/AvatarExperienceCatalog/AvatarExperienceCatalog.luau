local _ = require(script.Api.GetCatalogV2SearchItemDetails.Types.AXPagesTypes)
local _ = require(script.Models.WidgetListInfo)
local _ = require(script.Models.CatalogV2SearchItemDetails)
local _ = require(script.Components.ResultsList.WidgetListInfoViewModel)
local _ = require(script.Api.GetFaeStatus.normalizeFaeStatus)
local _ = require(script.Stores)

return {
	Api = {
		getWidgetListInfo = require(script.Api.GetWidgetListInfo.getWidgetListInfo),
		getWidgetListInfoSearch = require(script.Api.GetWidgetListInfo.getWidgetListInfoSearch),
		getLooksFromWidgetListInfo = require(script.Api.GetWidgetListInfo.getLooksFromWidgetListInfo),
		getCatalogV2SearchItemDetails = require(script.Api.GetCatalogV2SearchItemDetails.getCatalogV2SearchItemDetails).getCatalogV2SearchItemDetails,
		CatalogSearchAXPages = require(script.Api.GetCatalogV2SearchItemDetails.Types.CatalogSearchAXPages),
		getCatalogCategories = require(script.Api.GetCatalogCategories.getCatalogCategories).getCatalogCategories,
		getFaeStatus = require(script.Api.GetFaeStatus.getFaeStatus).getFaeStatus,
		trackSponsoredItemClick = require(script.Api.TrackSponsoredItemClick.trackSponsoredItemClick)
	},
	Components = {
		CatalogSduiFeedEntryPoint = require(script.Sdui.CatalogSduiFeedEntryPoint),
		CatalogSduiCategoryMenuEntryPoint = require(script.Sdui.CatalogSduiCategoryMenuEntryPoint),
		MarketplaceFeedSkeleton = require(script.Components.MarketplaceFeedSkeleton.MarketplaceFeedSkeleton),
		MarketplaceCategoryMenuSkeleton = require(script.Components.MarketplaceCategoryMenuSkeleton.MarketplaceCategoryMenuSkeleton),
		CatalogOffersBanner = require(script.Components.CatalogOffersBanner.CatalogOffersBanner),
		CatalogItemGroupSort = {
			CatalogItemGroupSortContainer = require(script.Components.CatalogItemGroupSort.CatalogItemGroupSortContainer),
			CatalogItemGroupSortView = require(script.Components.CatalogItemGroupSort.CatalogItemGroupSortView),
			useCatalogItemGroupSortViewModel = require(script.Components.CatalogItemGroupSort.useCatalogItemGroupSortViewModel)
		},
		CatalogItemCarouselSort = {
			CatalogItemCarouselSortContainer = require(script.Components.CatalogItemCarouselSort.CatalogItemCarouselSortContainer),
			CatalogItemCarouselSortView = require(script.Components.CatalogItemCarouselSort.CatalogItemCarouselSortView),
			useCatalogItemCarouselSortViewModel = require(script.Components.CatalogItemCarouselSort.useCatalogItemCarouselSortViewModel)
		},
		Checkout = {
			CheckoutPage = require(script.Components.Checkout.CheckoutPage),
			CheckoutPageContainer = require(script.Components.Checkout.CheckoutPageContainer),
			CheckoutActionBarContainer = require(script.Components.Checkout.CheckoutActionBarContainer),
			OwnedActionBar = require(script.Components.Checkout.OwnedActionBar)
		},
		ResultsList = {
			useWidgetListInfoViewModel = require(script.Components.ResultsList.useWidgetListInfoViewModel),
			WidgetListBreakPointEnum = require(script.Components.ResultsList.WidgetListBreakPointEnum),
			WidgetListBreakPointThresholds = require(script.Components.ResultsList.WidgetListBreakPointThresholds),
			WidgetListBreakPointSizeMap = require(script.Components.ResultsList.WidgetListBreakPointSizeMap),
			getOrderedWidgets = require(script.Components.ResultsList.getOrderedWidgets)
		},
		WidgetPanelContainer = require(script.Components.WidgetPanel.WidgetPanelContainer),
		Prompts = {
			ClearAllItemsOnAvatarPrompt = require(script.Components.Prompts.ClearAllItemsOnAvatarPrompt),
			WearAvatarReplaceAllItemsPrompt = require(script.Components.Prompts.WearAvatarReplaceAllItemsPrompt),
			CartUnavailableItemsPrompt = require(script.Components.Prompts.CartUnavailableItemsPrompt),
			GoToCustomizeToEditPrompt = require(script.Components.Prompts.GoToCustomizeToEditPrompt),
			ItemReplacedOnAvatarPrompt = require(script.Components.Prompts.ItemReplacedOnAvatarPrompt),
			ItemsUnavailablePrompt = require(script.Components.Prompts.ItemsUnavailablePrompt),
			TimeoutStatusPrompt = require(script.Components.Prompts.TimeoutStatusPrompt)
		}
	},
	Constants = require(script.Constants),
	WidgetConstants = require(script.WidgetConstants),
	Hooks = {
		useMultiItemShoppingFtux = require(script.Hooks.useMultiItemShoppingFtux),
		useTimedOptionsFtux = require(script.Hooks.useTimedOptionsFtux),
		useCatalogPageTimeoutPrompt = require(script.Hooks.useCatalogPageTimeoutPrompt),
		useMakeupFtux = require(script.Hooks.useMakeupFtux),
		useMakeupLayeringTooltip = require(script.Hooks.useMakeupLayeringTooltip),
		useCatalogPageMakeupReleaseFtux = require(script.Hooks.useCatalogPageMakeupReleaseFtux),
		useWidgetItemImpressions = require(script.Hooks.useWidgetItemImpressions),
		useWidgetItemPayload = require(script.Hooks.useWidgetItemPayload),
		useAddUnifiedLoggingToCatalogSortEffect = require(script.Components.Hooks.useAddUnifiedLoggingToCatalogSortEffect),
		useHydrateCatalogSortOnDemandEffect = require(script.Components.Hooks.useHydrateCatalogSortOnDemandEffect),
		useHydrateCatalogItemGridOnDemandEffect = require(script.Components.Hooks.useHydrateCatalogItemGridOnDemandEffect),
		useShouldFetchCartPricingForPurchasePrompt = require(script.Hooks.useShouldFetchCartPricingForPurchasePrompt),
		useShouldFetchCartPricingForLookPurchasePrompt = require(script.Hooks.useShouldFetchCartPricingForLookPurchasePrompt),
		useOnRequestImpressionsSignal = require(script.Components.Hooks.useOnRequestImpressionsSignal)
	},
	Utils = {
		WidgetIxpLayerMap = require(script.Utils.WidgetIxpLayerMap),
		getFooterVisibilityFromItemFooters = require(script.Utils.getFooterVisibilityFromItemFooters),
		resolveWidgetListItemBottomPaddingPx = require(script.Utils.resolveWidgetListItemBottomPaddingPx),
		getBreakpointFromRowWidth = require(script.Utils.getBreakpointFromRowWidth),
		getUIScaleFromTokens = require(script.Utils.getUIScaleFromTokens),
		getShouldPageUseWidgetOnlyFetcher = require(script.Utils.getShouldPageUseWidgetOnlyFetcher),
		logEditorTaxonomyExposureIfApplicable = require(script.Utils.logEditorTaxonomyExposureIfApplicable),
		TryOns = {
			getEquippableAssetsFromTryOnItems = require(script.Utils.TryOns.getEquippableAssetsFromTryOnItems),
			getDoesBundleHaveClothingOrAccessories = require(script.Utils.TryOns.getDoesBundleHaveClothingOrAccessories),
			getTryOnItemsContainsOnlyMakeupTypes = require(script.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes)
		}
	},
	Context = {
		AXCatalogStoreContext = require(script.Context.AXCatalogStoreContext),
		useAXCatalogStoreContext = require(script.Context.useAXCatalogStoreContext)
	},
	Providers = {
		CatalogPageMonolithDependenciesContext = require(script.Providers.CatalogPageMonolithDependenciesContext)
	},
	Stores = {
		getCatalogStores = require(script.Stores),
		getAXMarketplaceWidgetStore = require(script.Stores.GetAXMarketplaceWidgetStore),
		getAvatarsTabSearchInfoStore = require(script.Stores.GetAvatarsTabSearchInfoStore),
		getCatalogPageRequestIdStore = require(script.Stores.GetCatalogPageRequestIdStore),
		GetFaeFeatureAccessStore = require(script.Stores.GetFaeFeatureAccessStore)
	},
	State = {
		Actions = {
			PurchaseItemsSuccess = require(script.State.Actions.PurchaseItemsSuccess),
			FetchAssetOrBundleInfoBatchedSuccess = require(script.State.Actions.FetchAssetOrBundleInfoBatchedSuccess),
			FetchCollectibleItemDataBatchedSuccess = require(script.State.Actions.FetchCollectibleItemDataBatchedSuccess),
			SetSelectedTimedOption = require(script.State.Actions.SetSelectedTimedOption)
		},
		Selectors = {
			selectHydratedWidgetData = require(script.State.Selectors.selectHydratedWidgetData)
		}
	},
	Sdui = {
		fetchCatalogPage = require(script.Sdui.fetchCatalogPage),
		CatalogSduiPageContext = require(script.Sdui.CatalogSduiPageContext),
		getCatalogConfigKey = require(script.Sdui.Utils.getCatalogConfigKey),
		getCatalogPageIdentifier = require(script.Sdui.Utils.getCatalogPageIdentifier),
		buildOrderedWidgetsFromCatalogPage = require(script.Sdui.buildOrderedWidgetsFromCatalogPage),
		hydrateCatalogSortEntities = require(script.Sdui.hydrateCatalogSortEntities),
		hydrateCatalogSortById = require(script.Sdui.hydrateCatalogSortById),
		buildFocusedSortWidgetInfo = require(script.Sdui.buildFocusedSortWidgetInfo),
		resolveSduiFocusedSortContext = require(script.Sdui.resolveSduiFocusedSortContext),
		useApplySduiFocusedSort = require(script.Sdui.useApplySduiFocusedSort),
		useClearSduiFocusedSort = require(script.Sdui.useClearSduiFocusedSort),
		useCatalogSduiPageRequestId = require(script.Sdui.Hooks.useCatalogSduiPageRequestId),
		createMapMarketplaceCategoryToCatalogCategory = require(script.Sdui.createMapMarketplaceCategoryToCatalogCategory)
	},
	Thunks = {
		SaveAsMakeupLookThunk = require(script.State.Thunks.SaveAsMakeupLookThunk)
	},
	["jest.config"] = script["jest.config"]
}