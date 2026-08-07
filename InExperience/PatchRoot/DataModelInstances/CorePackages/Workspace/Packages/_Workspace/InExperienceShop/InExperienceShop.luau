local fFlagEnableExperienceShopGlobalIconModule = require(script.Flags.FFlagEnableExperienceShopGlobalIcon)

return {
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	ShopContainer = require(script.Components.ShopContainerWrapper.ShopContainer),
	ShopGlobalIcon = if fFlagEnableExperienceShopGlobalIconModule then require(script.Components.ShopGlobalIcon) else nil,
	initiateShopItemPurchase = require(script.initiateShopItemPurchase),
	initShopGlobalIcon = if fFlagEnableExperienceShopGlobalIconModule then require(script.initShopGlobalIcon) else nil,
	GetShopGlobalIconStore = if fFlagEnableExperienceShopGlobalIconModule then require(script.Stores.GetShopGlobalIconStore) else nil,
	FFlagEnableExperienceShopGlobalIcon = fFlagEnableExperienceShopGlobalIconModule,
	FFlagEnableShopPrefetch = require(script.Flags.FFlagEnableShopPrefetch),
	FFlagHideShopMenuOnFailure = require(script.Flags.FFlagHideShopMenuOnFailure),
	FFlagCenterInExperienceShopWindow = require(script.Flags.FFlagCenterInExperienceShopWindow),
	FFlagExperienceShopNewIconography = require(script.Flags.FFlagExperienceShopNewIconography)
}