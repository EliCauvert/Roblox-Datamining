local IAPExperience = script:FindFirstAncestor("IAPExperience")
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local multiItemPriceQualifiesForDetailsDiscountSummaryModule = require(IAPExperience.Generic.multiItemPriceQualifiesForDetailsDiscountSummary)

return function(p0) --[[ line: 16 | named "multiItemPriceShowsDiscountAccordion" ]]
	-- upvalues: multiItemPriceQualifiesForDetailsDiscountSummaryModule (ref)
	if not p0 then
		return false
	end
	local basePriceInRobux = p0.basePriceInRobux
	local priceInRobux = p0.priceInRobux
	
	return typeof(basePriceInRobux) == "number" and typeof(priceInRobux) == "number" and basePriceInRobux > priceInRobux and multiItemPriceQualifiesForDetailsDiscountSummaryModule(p0)
end