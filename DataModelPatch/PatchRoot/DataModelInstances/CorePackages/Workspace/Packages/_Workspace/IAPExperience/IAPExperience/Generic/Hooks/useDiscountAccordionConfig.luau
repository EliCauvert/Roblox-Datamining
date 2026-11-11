local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local IconName = require(Parent1.Foundation).Enums.IconName
local _ = require(Parent.ProductPurchase.PricingTypes)

return function(p1)
	-- upvalues: ReactModule (copy), IconName (copy)
	local ItemPrice = p1.itemPrice
	local HasSubscriptionDiscount = p1.hasSubscriptionDiscount
	local BlackbirdSummaryText = p1.blackbirdSummaryText
	local SavingsSummary = p1.savingsSummary
	
	return {
		showAccordion = ItemPrice.priceInRobux < ItemPrice.basePriceInRobux and (HasSubscriptionDiscount or #ItemPrice.discounts >= 2),
		accordionHeaderText = ReactModule.useMemo(function()
			-- upvalues: SavingsSummary (copy), BlackbirdSummaryText (copy)
			return if SavingsSummary == nil or SavingsSummary == "" then BlackbirdSummaryText else SavingsSummary
		end, { SavingsSummary, BlackbirdSummaryText }),
		accordionLeadingIcon = if HasSubscriptionDiscount then IconName.RobloxPlus else IconName.Tag
	}
end