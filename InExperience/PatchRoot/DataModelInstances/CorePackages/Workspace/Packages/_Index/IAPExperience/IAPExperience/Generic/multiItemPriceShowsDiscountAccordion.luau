local IAPExperience = script:FindFirstAncestor("IAPExperience")
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local multiItemPriceQualifiesForDetailsDiscountSummaryModule = require(IAPExperience.Generic.multiItemPriceQualifiesForDetailsDiscountSummary)

return function(p1)
	-- upvalues: multiItemPriceQualifiesForDetailsDiscountSummaryModule (ref)
	if not p1 then
		return false
	end
	local basePriceInRobux = p1.basePriceInRobux
	local priceInRobux = p1.priceInRobux
	
	return typeof(basePriceInRobux) == "number" and typeof(priceInRobux) == "number" and basePriceInRobux > priceInRobux and multiItemPriceQualifiesForDetailsDiscountSummaryModule(p1)
end