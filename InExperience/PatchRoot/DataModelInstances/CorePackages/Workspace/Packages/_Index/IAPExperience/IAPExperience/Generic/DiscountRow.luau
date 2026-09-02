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
local fixBlackbirdDiscountStringWithEligibleItems = game:DefineFastFlag("FixBlackbirdDiscountStringWithEligibleItems", false)
local var1 = getIconRichText(iconName.Robux)

local function _(p1, p2)
	return if p1 == nil or p1 == "" then p2 else p1
end

local function RobloxSubscriptionDiscountRow(p1)
	-- upvalues: localizationService (ref), reactModule (ref), var1 (ref), formatNumberModule (ref), useLocalization (ref), fixBlackbirdDiscountStringWithEligibleItems (ref), priceLineItemModule (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local discountLabel
	local discount = p1.discount
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), formatNumberModule (copy), robloxLocaleId (ref), discount (ref)
		return string.format("- %s %s", var1, formatNumberModule(robloxLocaleId, discount.amountInRobux))
	end, { robloxLocaleId, discount.amountInRobux })
	local var3 = useLocalization({
		discountLabel = if discount.percent > 0 then {
			if fixBlackbirdDiscountStringWithEligibleItems then "IAPExperience.PurchasePrompt.Label.BlackbirdDiscountEligibleItems" else "IAPExperience.PurchasePrompt.Label.BlackbirdDiscount",
			discountPercentage = discount.percent
		} else "IAPExperience.PurchasePrompt.Label.BlackbirdDiscountNoPercent"
	})
	local createElement = reactModule.createElement
	local t = {}
	
	if fFlagPurchasePromptFetchCartPricing then
		local label = p1.label
		discountLabel = if label == nil or label == "" then var3.discountLabel else label
	else
		discountLabel = var3.discountLabel
	end
	t.label = discountLabel
	t.amount = var2
	t.LayoutOrder = p1.LayoutOrder
	
	return createElement(priceLineItemModule, t)
end

local function GenericDiscountRow(p2)
	-- upvalues: localizationService (ref), reactModule (ref), var1 (ref), formatNumberModule (ref), useLocalization (ref), priceLineItemModule (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local discountLabel
	local discount = p2.discount
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), formatNumberModule (copy), robloxLocaleId (ref), discount (ref)
		return string.format("- %s %s", var1, formatNumberModule(robloxLocaleId, discount.amountInRobux))
	end, { robloxLocaleId, discount.amountInRobux })
	local var5 = useLocalization({
		discountLabel = if discount.percent > 0 then {
			"IAPExperience.PurchasePrompt.Label.GenericDiscount",
			discountPercentage = discount.percent
		} else "IAPExperience.PurchasePrompt.Label.GenericDiscountNoPercent"
	})
	local createElement = reactModule.createElement
	local t = {}
	
	if fFlagPurchasePromptFetchCartPricing then
		local label = p2.label
		discountLabel = if label == nil or label == "" then var5.discountLabel else label
	else
		discountLabel = var5.discountLabel
	end
	t.label = discountLabel
	t.amount = var4
	t.LayoutOrder = p2.LayoutOrder
	
	return createElement(priceLineItemModule, t)
end

local t = {
	[discountType.BlackbirdSubscription] = RobloxSubscriptionDiscountRow,
	[discountType.RobloxPlusSubscription] = RobloxSubscriptionDiscountRow
}

return function(p2)
	-- upvalues: t (ref), GenericDiscountRow (ref), reactModule (ref)
	return reactModule.createElement(t[p2.discount.type] or GenericDiscountRow, p2)
end