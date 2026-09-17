local parent = script.Parent
local _ = require(script.Types)
local priceStatusModule = require(script.Enums.PriceStatus)
local useViewBreakpointsModule = require(script.Hooks.useViewBreakpoints)
local useResponsivePanelLayoutPropsModule = require(script.Components.useResponsivePanelLayoutProps)
local useInspectAndBuyFocusNavigationModule = require(script.Hooks.useInspectAndBuyFocusNavigation)
local viewTypeModule = require(script.Enums.ViewType)
local inspectAndBuyVersionModule = require(script.Enums.InspectAndBuyVersion)
local constantsModule = require(script.Constants)
local buyActionBarModule = require(script.Components.Common.BuyActionBar)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy or require(parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local _ = require(script.Stores.createItemSelectionStore)

return {
	Enums = {
		PriceStatus = priceStatusModule,
		ViewType = viewTypeModule,
		InspectAndBuyVersion = inspectAndBuyVersionModule
	},
	Utils = {
		getPriceStatus = require(script.Utils.getPriceStatus),
		getPriceStatusInShop = if fFlagSocialEnableProfileInspectAndBuy then require(script.Utils.getPriceStatusInShop) else nil,
		getPriceLineContent = if fFlagSocialEnableProfileInspectAndBuy then require(script.Utils.getPriceLineContent) else nil,
		getViewType = require(script.Utils.getViewType),
		applyTryOnItemToHumanoidDescription = require(script.Utils.applyTryOnItemToHumanoidDescription),
		convertAssetInfoToItemData = require(script.Utils.convertAssetInfoToItemData),
		convertBundleInfoToItemData = require(script.Utils.convertBundleInfoToItemData),
		itemDetailsUtils = require(script.Utils.itemDetailsUtils),
		buildBulkPurchaseAnalyticsPayload = require(script.Utils.buildBulkPurchaseAnalyticsPayload),
		buildItemDataFromAXRodux = require(script.Utils.buildItemDataFromAXRodux),
		getTryOnItemsTotalPrice = require(script.Utils.getTryOnItemsTotalPrice),
		selectItemDataForTryOnItems = require(script.Utils.selectItemDataForTryOnItems)
	},
	Hooks = {
		useViewBreakpoints = useViewBreakpointsModule,
		useResponsivePanelLayoutProps = useResponsivePanelLayoutPropsModule,
		useInspectAndBuyFocusNavigation = useInspectAndBuyFocusNavigationModule
	},
	Components = {
		BuyActionBar = buyActionBarModule,
		ResponsivePanelLayout = require(script.Components.Common.ResponsivePanelLayout),
		SelectableItemCardRow = require(script.Components.Common.SelectableItemCardRow.SelectableCardRowContainer),
		SelectableItemCardList = require(script.Components.Common.SelectableItemCardList.SelectableItemCardList)
	},
	Contexts = {
		ItemSelectionStoreContext = require(script.Contexts.ItemSelectionStoreContext)
	},
	Constants = constantsModule,
	["jest.config"] = script["jest.config"]
}