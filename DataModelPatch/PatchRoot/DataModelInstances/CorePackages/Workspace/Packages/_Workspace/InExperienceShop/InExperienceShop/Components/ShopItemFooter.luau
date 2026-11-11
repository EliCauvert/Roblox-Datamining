local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(InExperienceShop.Types)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local config = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy"
}

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), InitiateShopItemPurchaseModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: InitiateShopItemPurchaseModule (upval), Frame (copy)
		InitiateShopItemPurchaseModule(Frame.itemId, Frame.itemType)
	end, { Frame.itemId, Frame.itemType })
	
	return if Frame.isOwned or false then ReactModule.createElement(Button, {
		isDisabled = true,
		text = UseLocalizationResult.owned,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		width = UDim.new(1, 0),
		LayoutOrder = Frame.LayoutOrder,
		onActivated = function() end
	}) else ReactModule.createElement(Button, {
		text = UseLocalizationResult.buy,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		width = UDim.new(1, 0),
		onActivated = UseResult,
		LayoutOrder = Frame.LayoutOrder
	})
end)