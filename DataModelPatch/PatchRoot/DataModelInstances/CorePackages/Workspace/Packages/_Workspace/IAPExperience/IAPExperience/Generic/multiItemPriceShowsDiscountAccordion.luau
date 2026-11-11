local IAPExperience = script:FindFirstAncestor("IAPExperience")
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local MultiItemPriceQualifiesForDetailsDiscountSummaryModule = require(IAPExperience.Generic.multiItemPriceQualifiesForDetailsDiscountSummary)

return function(p1)
	-- upvalues: MultiItemPriceQualifiesForDetailsDiscountSummaryModule (copy)
	if p1 then
		local BasePriceInRobux = p1.basePriceInRobux
		local PriceInRobux = p1.priceInRobux
		
		return typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and BasePriceInRobux > PriceInRobux and MultiItemPriceQualifiesForDetailsDiscountSummaryModule(p1)
	else
		return false
	end
end