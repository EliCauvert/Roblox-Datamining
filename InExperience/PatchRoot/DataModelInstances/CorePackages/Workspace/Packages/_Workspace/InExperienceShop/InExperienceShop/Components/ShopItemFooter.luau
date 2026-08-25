local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(inExperienceShop.Types)
local initiateShopItemPurchaseModule = require(inExperienceShop.initiateShopItemPurchase)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local t = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy",
	try = "Feature.Catalog.Action.Try"
}

return reactModule.memo(function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), button (ref), buttonVariant (ref), inputSize (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref)
	local var6 = useLocalization(t)
	
	return if p0.isOwned or false then reactModule.createElement(button, {
		isDisabled = true,
		text = var6.owned,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		width = UDim.new(1, 0),
		LayoutOrder = p0.LayoutOrder,
		onActivated = function() end
	}) elseif fFlagLuaAppEnableGamePassFreeTrialsModule and p0.showTry then reactModule.createElement(button, {
		text = var6.try,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		width = UDim.new(1, 0),
		onActivated = function() end,
		LayoutOrder = p0.LayoutOrder
	}) else reactModule.createElement(button, {
		text = var6.buy,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		width = UDim.new(1, 0),
		onActivated = reactModule.useCallback(function()
			-- upvalues: initiateShopItemPurchaseModule (copy), p0 (ref)
			initiateShopItemPurchaseModule(p0.itemId, p0.itemType, p0.shopPageType)
		end, { p0.itemId, p0.itemType, p0.shopPageType }),
		LayoutOrder = p0.LayoutOrder
	})
end)