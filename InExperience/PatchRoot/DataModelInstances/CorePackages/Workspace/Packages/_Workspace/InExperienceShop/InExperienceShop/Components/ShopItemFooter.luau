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
local t = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy"
}

return reactModule.memo(function(p0) --[[ line: 30 | named "ShopItemFooter" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var5 = useLocalization(t)
	
	return if p0.isOwned or false then reactModule.createElement(button, {
		isDisabled = true,
		text = var5.owned,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		width = UDim.new(1, 0),
		LayoutOrder = p0.LayoutOrder,
		onActivated = function() --[[ line: 46 ]] end
	}) else reactModule.createElement(button, {
		text = var5.buy,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		width = UDim.new(1, 0),
		onActivated = reactModule.useCallback(function() --[[ line: 34 ]]
			-- upvalues: initiateShopItemPurchaseModule (copy), p0 (ref)
			initiateShopItemPurchaseModule(p0.itemId, p0.itemType)
		end, { p0.itemId, p0.itemType }),
		LayoutOrder = p0.LayoutOrder
	})
end)