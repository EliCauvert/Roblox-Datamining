local Parent = script.Parent
local _ = require(script.Types)
local FFlagAXIaBEnableShopContext = require(Parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy or FFlagAXIaBEnableShopContext
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
		convertAssetInfoToItemData = require(script.Utils.convertAssetInfoToItemData),
		convertBundleInfoToItemData = require(script.Utils.convertBundleInfoToItemData),
		itemDetailsUtils = require(script.Utils.itemDetailsUtils),
		buildBulkPurchaseAnalyticsPayload = require(script.Utils.buildBulkPurchaseAnalyticsPayload),
		buildItemDataFromAXRodux = require(script.Utils.buildItemDataFromAXRodux),
		getTryOnItemsTotalPrice = require(script.Utils.getTryOnItemsTotalPrice),
		selectItemDataForTryOnItems = require(script.Utils.selectItemDataForTryOnItems),
		formatNumber = require(script.Utils.formatNumber)
	},
	Hooks = {
		useViewBreakpoints = require(script.Hooks.useViewBreakpoints),
		useResponsivePanelLayoutProps = require(script.Components.useResponsivePanelLayoutProps),
		useInspectAndBuyFocusNavigation = require(script.Hooks.useInspectAndBuyFocusNavigation)
	},
	Components = {
		BuyActionBar = require(script.Components.Common.BuyActionBar),
		ResponsivePanelLayout = require(script.Components.Common.ResponsivePanelLayout),
		SelectableItemCardRow = require(script.Components.Common.SelectableItemCardRow.SelectableCardRowContainer),
		SelectableItemCardList = require(script.Components.Common.SelectableItemCardList.SelectableItemCardList)
	},
	Contexts = {
		ItemSelectionStoreContext = require(script.Contexts.ItemSelectionStoreContext)
	},
	Constants = require(script.Constants),
	["jest.config"] = script["jest.config"]
}