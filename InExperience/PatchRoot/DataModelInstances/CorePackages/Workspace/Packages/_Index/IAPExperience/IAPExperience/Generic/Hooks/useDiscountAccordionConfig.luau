local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local iconName = require(parent_1.Foundation).Enums.IconName
local _ = require(parent.ProductPurchase.PricingTypes)

return function(p1)
	-- upvalues: reactModule (ref), iconName (ref)
	local itemPrice = p1.itemPrice
	local hasSubscriptionDiscount = p1.hasSubscriptionDiscount
	local blackbirdSummaryText = p1.blackbirdSummaryText
	local savingsSummary = p1.savingsSummary
	
	return {
		showAccordion = itemPrice.priceInRobux < itemPrice.basePriceInRobux and (hasSubscriptionDiscount or #itemPrice.discounts >= 2),
		accordionHeaderText = reactModule.useMemo(function()
			-- upvalues: savingsSummary (ref), blackbirdSummaryText (ref)
			return if savingsSummary == nil or savingsSummary == "" then blackbirdSummaryText else savingsSummary
		end, { savingsSummary, blackbirdSummaryText }),
		accordionLeadingIcon = if not hasSubscriptionDiscount then iconName.Tag else iconName.RobloxPlus
	}
end