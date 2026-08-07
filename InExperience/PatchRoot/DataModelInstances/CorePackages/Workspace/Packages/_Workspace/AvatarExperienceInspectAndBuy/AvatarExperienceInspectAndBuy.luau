local parent = script.Parent
local _ = require(script.Types)
local priceStatusModule = require(script.Enums.PriceStatus)
local useViewBreakpointsModule = require(script.Hooks.useViewBreakpoints)
local useResponsivePanelLayoutPropsModule = require(script.Components.useResponsivePanelLayoutProps)
local useInspectAndBuyFocusNavigationModule = require(script.Hooks.useInspectAndBuyFocusNavigation)
local viewTypeModule = require(script.Enums.ViewType)
local inspectAndBuyVersionModule = require(script.Enums.InspectAndBuyVersion)
local constantsModule = require(script.Constants)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
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
		convertAssetInfoToItemData = if fFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.convertAssetInfoToItemData) else nil,
		convertBundleInfoToItemData = if fFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.convertBundleInfoToItemData) else nil,
		itemDetailsUtils = if fFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.itemDetailsUtils) else nil,
		buildBulkPurchaseAnalyticsPayload = if fFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.buildBulkPurchaseAnalyticsPayload) else nil
	},
	Hooks = {
		useViewBreakpoints = useViewBreakpointsModule,
		useResponsivePanelLayoutProps = useResponsivePanelLayoutPropsModule,
		useInspectAndBuyFocusNavigation = useInspectAndBuyFocusNavigationModule
	},
	Components = {
		BuyActionBar = if fFlagSocialEnableProfileInspectAndBuy then require(script.Components.Common.BuyActionBar) else nil,
		ResponsivePanelLayout = require(script.Components.Common.ResponsivePanelLayout)
	},
	Contexts = {
		ItemSelectionStoreContext = if fFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Contexts.ItemSelectionStoreContext) else nil
	},
	Constants = constantsModule,
	["jest.config"] = script["jest.config"]
}