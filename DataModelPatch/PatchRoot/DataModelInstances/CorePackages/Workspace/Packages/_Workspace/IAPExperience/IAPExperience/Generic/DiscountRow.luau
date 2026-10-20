local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FormatNumberModule = require(IAPExperience.Utility.formatNumber)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PriceLineItemModule = require(IAPExperience.Generic.PriceLineItem)
local DiscountType = require(IAPExperience.ProductPurchase.PricingTypes).DiscountType
local FFlagPurchasePromptFetchCartPricing = require(IAPExperience.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local IconRichText = FoundationModule.Utility.getIconRichText(FoundationModule.Enums.IconName.Robux)

local function _(p1, p2)
	return if p1 == nil or p1 == "" then p2 else p1
end

local function RobloxSubscriptionDiscountRow(Frame)
	-- upvalues: LocalizationService (copy), ReactModule (copy), IconRichText (copy), FormatNumberModule (copy), UseLocalizationFunction (copy), PriceLineItemModule (copy), FFlagPurchasePromptFetchCartPricing (copy)
	local Discount = Frame.discount
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: IconRichText (upval), FormatNumberModule (upval), RobloxLocaleId (copy), Discount (copy)
		return string.format("- %s %s", IconRichText, FormatNumberModule(RobloxLocaleId, Discount.amountInRobux))
	end, { RobloxLocaleId, Discount.amountInRobux })
	local IsPercentAbove = Discount.percent > 0
	local UseLocalizationResult = UseLocalizationFunction({
		discountLabel = if IsPercentAbove then {
			"IAPExperience.PurchasePrompt.Label.BlackbirdDiscount",
			discountPercentage = Discount.percent
		} else "IAPExperience.PurchasePrompt.Label.BlackbirdDiscountNoPercent"
	})
	local CreateElementFunction = ReactModule.createElement
	local t = {}
	local DiscountLabel1 = nil
	
	if FFlagPurchasePromptFetchCartPricing then
		local Label = Frame.label
		local DiscountLabel = UseLocalizationResult.discountLabel
		DiscountLabel1 = if Label == nil or Label == "" then DiscountLabel else Label
	else
		DiscountLabel1 = UseLocalizationResult.discountLabel
	end
	t.label = DiscountLabel1
	t.amount = UseMemoResult
	t.LayoutOrder = Frame.LayoutOrder
	
	return CreateElementFunction(PriceLineItemModule, t)
end

local function GenericDiscountRow(Frame)
	-- upvalues: LocalizationService (copy), ReactModule (copy), IconRichText (copy), FormatNumberModule (copy), UseLocalizationFunction (copy), PriceLineItemModule (copy), FFlagPurchasePromptFetchCartPricing (copy)
	local Discount = Frame.discount
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: IconRichText (upval), FormatNumberModule (upval), RobloxLocaleId (copy), Discount (copy)
		return string.format("- %s %s", IconRichText, FormatNumberModule(RobloxLocaleId, Discount.amountInRobux))
	end, { RobloxLocaleId, Discount.amountInRobux })
	local IsPercentAbove = Discount.percent > 0
	local UseLocalizationResult = UseLocalizationFunction({
		discountLabel = if IsPercentAbove then {
			"IAPExperience.PurchasePrompt.Label.GenericDiscount",
			discountPercentage = Discount.percent
		} else "IAPExperience.PurchasePrompt.Label.GenericDiscountNoPercent"
	})
	local CreateElementFunction = ReactModule.createElement
	local t = {}
	local DiscountLabel1 = nil
	
	if FFlagPurchasePromptFetchCartPricing then
		local Label = Frame.label
		local DiscountLabel = UseLocalizationResult.discountLabel
		DiscountLabel1 = if Label == nil or Label == "" then DiscountLabel else Label
	else
		DiscountLabel1 = UseLocalizationResult.discountLabel
	end
	t.label = DiscountLabel1
	t.amount = UseMemoResult
	t.LayoutOrder = Frame.LayoutOrder
	
	return CreateElementFunction(PriceLineItemModule, t)
end

local config = {
	[DiscountType.BlackbirdSubscription] = RobloxSubscriptionDiscountRow,
	[DiscountType.RobloxPlusSubscription] = RobloxSubscriptionDiscountRow
}

return function(p1)
	-- upvalues: config (copy), GenericDiscountRow (copy), ReactModule (copy)
	return ReactModule.createElement(config[p1.discount.type] or GenericDiscountRow, p1)
end