local FFlagEnableExperienceShopGlobalIconModule = require(script.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagEnableFreeTrialTopBarChipModule = require(script.Flags.FFlagEnableFreeTrialTopBarChip)

return {
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	ShopContainer = require(script.Components.ShopContainerWrapper.ShopContainer),
	ShopGlobalIcon = if FFlagEnableExperienceShopGlobalIconModule then require(script.Components.ShopGlobalIcon) else nil,
	initiateShopItemPurchase = require(script.initiateShopItemPurchase),
	initShopGlobalIcon = if FFlagEnableExperienceShopGlobalIconModule then require(script.initShopGlobalIcon) else nil,
	GetShopGlobalIconStore = if FFlagEnableExperienceShopGlobalIconModule then require(script.Stores.GetShopGlobalIconStore) else nil,
	requestOpenToRobuxTab = require(script.Utils.requestOpenToRobuxTab),
	setOpenedFromBuyRobux = require(script.Utils.setOpenedFromBuyRobux),
	FFlagEnableExperienceShopGlobalIcon = FFlagEnableExperienceShopGlobalIconModule,
	FFlagEnableShopPrefetch = require(script.Flags.FFlagEnableShopPrefetch),
	FFlagHideShopMenuOnFailure = require(script.Flags.FFlagHideShopMenuOnFailure),
	FFlagCenterInExperienceShopWindow = require(script.Flags.FFlagCenterInExperienceShopWindow),
	FFlagFixInExperienceShopCursorLock = require(script.Flags.FFlagFixInExperienceShopCursorLock),
	FFlagExperienceShopNewIconography = require(script.Flags.FFlagExperienceShopNewIconography),
	FFlagEnableFreeTrialShopMenuBadge = require(script.Flags.FFlagEnableFreeTrialShopMenuBadge),
	FFlagMenuBadgePreferFreeTrialOverOffer = require(script.Flags.FFlagMenuBadgePreferFreeTrialOverOffer),
	FFlagEnableFreeTrialBlueDot = require(script.Flags.FFlagEnableFreeTrialBlueDot),
	FFlagEnableFreeTrialTopBarChip = FFlagEnableFreeTrialTopBarChipModule,
	FreeTrialTopBarSlot = if FFlagEnableFreeTrialTopBarChipModule then require(script.Components.FreeTrialTopBarSlot) else nil
}