local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(InExperienceShop.Types)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local config = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy",
	try = "Feature.Catalog.Action.Try"
}

return ReactModule.memo(function(Frame: Frame) --[[ Line: 42 | Named "ShopItemFooter" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), InitiateShopItemPurchaseModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local PurchaseCategoryLocation = Frame.purchaseCategoryLocation
	local UseResult = ReactModule.useCallback(function() --[[ Line: 47 ]]
		-- upvalues: FFlagCategoryLoggingInShopPurchaseModule (upval), PurchaseCategoryLocation (copy), InitiateShopItemPurchaseModule (upval), Frame (copy)
		if FFlagCategoryLoggingInShopPurchaseModule and PurchaseCategoryLocation ~= nil then
			InitiateShopItemPurchaseModule(Frame.itemId, Frame.itemType, Frame.shopPageType, PurchaseCategoryLocation)
			
			return
		else
			InitiateShopItemPurchaseModule(Frame.itemId, Frame.itemType, Frame.shopPageType)
		end
	end, {
		Frame.itemId,
		Frame.itemType,
		Frame.shopPageType,
		PurchaseCategoryLocation
	})
	
	return if Frame.isOwned or false then ReactModule.createElement(Button, {
		isDisabled = true,
		text = UseLocalizationResult.owned,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		width = UDim.new(1, 0),
		LayoutOrder = Frame.LayoutOrder,
		onActivated = function() --[[ Line: 63 ]] end
	}) elseif FFlagLuaAppEnableGamePassFreeTrialsModule and Frame.showTry then ReactModule.createElement(Button, {
		text = UseLocalizationResult.try,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		width = UDim.new(1, 0),
		onActivated = Frame.onTryActivated or function() --[[ Line: 73 ]] end,
		isLoading = Frame.isActionLoading,
		isDisabled = Frame.isActionDisabled == true and Frame.isActionLoading ~= true,
		LayoutOrder = Frame.LayoutOrder
	}) else ReactModule.createElement(Button, {
		text = UseLocalizationResult.buy,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		width = UDim.new(1, 0),
		onActivated = UseResult,
		isDisabled = Frame.isActionDisabled == true,
		LayoutOrder = Frame.LayoutOrder
	})
end)