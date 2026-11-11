local Parent = script.Parent
local _ = require(script.Types)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(Parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local _ = require(script.Stores.createItemSelectionStore)

return {
	Enums = {
		PriceStatus = require(script.Enums.PriceStatus),
		ViewType = require(script.Enums.ViewType),
		InspectAndBuyVersion = require(script.Enums.InspectAndBuyVersion)
	},
	Utils = {
		getPriceStatus = require(script.Utils.getPriceStatus),
		getPriceStatusInShop = if FFlagSocialEnableProfileInspectAndBuy then require(script.Utils.getPriceStatusInShop) else nil,
		getPriceLineContent = if FFlagSocialEnableProfileInspectAndBuy then require(script.Utils.getPriceLineContent) else nil,
		getViewType = require(script.Utils.getViewType),
		applyTryOnItemToHumanoidDescription = require(script.Utils.applyTryOnItemToHumanoidDescription),
		convertAssetInfoToItemData = if FFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.convertAssetInfoToItemData) else nil,
		convertBundleInfoToItemData = if FFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.convertBundleInfoToItemData) else nil,
		itemDetailsUtils = if FFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.itemDetailsUtils) else nil,
		buildBulkPurchaseAnalyticsPayload = if FFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Utils.buildBulkPurchaseAnalyticsPayload) else nil
	},
	Hooks = {
		useViewBreakpoints = require(script.Hooks.useViewBreakpoints),
		useResponsivePanelLayoutProps = require(script.Components.useResponsivePanelLayoutProps),
		useInspectAndBuyFocusNavigation = require(script.Hooks.useInspectAndBuyFocusNavigation)
	},
	Components = {
		BuyActionBar = if FFlagSocialEnableProfileInspectAndBuy then require(script.Components.Common.BuyActionBar) else nil,
		ResponsivePanelLayout = require(script.Components.Common.ResponsivePanelLayout)
	},
	Contexts = {
		ItemSelectionStoreContext = if FFlagAXEnableIaBTimedOptionsBulkPurchase then require(script.Contexts.ItemSelectionStoreContext) else nil
	},
	Constants = require(script.Constants),
	["jest.config"] = script["jest.config"]
}