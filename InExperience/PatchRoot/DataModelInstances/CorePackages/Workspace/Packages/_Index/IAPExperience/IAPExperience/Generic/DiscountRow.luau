local IAPExperience = script:FindFirstAncestor("IAPExperience")
local parent = IAPExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local formatNumberModule = require(IAPExperience.Utility.formatNumber)
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent.Localization).Hooks.useLocalization
local priceLineItemModule = require(IAPExperience.Generic.PriceLineItem)
local discountType = require(IAPExperience.ProductPurchase.PricingTypes).DiscountType
local fFlagPurchasePromptFetchCartPricing = require(IAPExperience.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local var6 = getIconRichText(iconName.Robux)

local function _(p0, p1)
	return if p0 == nil or p0 == "" then p1 else p0
end

local function RobloxSubscriptionDiscountRow(p2)
	-- upvalues: localizationService (ref), reactModule (ref), var6 (ref), formatNumberModule (ref), useLocalization (ref), priceLineItemModule (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local discountLabel
	local discount = p2.discount
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var10 = reactModule.useMemo(function()
		-- upvalues: var6 (copy), formatNumberModule (copy), robloxLocaleId (ref), discount (ref)
		return string.format("- %s %s", var6, formatNumberModule(robloxLocaleId, discount.amountInRobux))
	end, { robloxLocaleId, discount.amountInRobux })
	local var11 = useLocalization({
		discountLabel = if discount.percent > 0 then {
			"IAPExperience.PurchasePrompt.Label.BlackbirdDiscount",
			discountPercentage = discount.percent
		} else "IAPExperience.PurchasePrompt.Label.BlackbirdDiscountNoPercent"
	})
	local createElement = reactModule.createElement
	local t = {}
	
	if fFlagPurchasePromptFetchCartPricing then
		local label = p2.label
		discountLabel = if label == nil or label == "" then var11.discountLabel else label
	else
		discountLabel = var11.discountLabel
	end
	t.label = discountLabel
	t.amount = var10
	t.LayoutOrder = p2.LayoutOrder
	
	return createElement(priceLineItemModule, t)
end

local function GenericDiscountRow(p3)
	-- upvalues: localizationService (ref), reactModule (ref), var6 (ref), formatNumberModule (ref), useLocalization (ref), priceLineItemModule (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local discountLabel
	local discount = p3.discount
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var13 = reactModule.useMemo(function()
		-- upvalues: var6 (copy), formatNumberModule (copy), robloxLocaleId (ref), discount (ref)
		return string.format("- %s %s", var6, formatNumberModule(robloxLocaleId, discount.amountInRobux))
	end, { robloxLocaleId, discount.amountInRobux })
	local var14 = useLocalization({
		discountLabel = if discount.percent > 0 then {
			"IAPExperience.PurchasePrompt.Label.GenericDiscount",
			discountPercentage = discount.percent
		} else "IAPExperience.PurchasePrompt.Label.GenericDiscountNoPercent"
	})
	local createElement = reactModule.createElement
	local t = {}
	
	if fFlagPurchasePromptFetchCartPricing then
		local label = p3.label
		discountLabel = if label == nil or label == "" then var14.discountLabel else label
	else
		discountLabel = var14.discountLabel
	end
	t.label = discountLabel
	t.amount = var13
	t.LayoutOrder = p3.LayoutOrder
	
	return createElement(priceLineItemModule, t)
end

local t = {
	[discountType.BlackbirdSubscription] = RobloxSubscriptionDiscountRow,
	[discountType.RobloxPlusSubscription] = RobloxSubscriptionDiscountRow
}

return function(p4)
	-- upvalues: t (ref), GenericDiscountRow (ref), reactModule (ref)
	return reactModule.createElement(t[p4.discount.type] or GenericDiscountRow, p4)
end