local _ = require(script.Parent.MonetizationPageView)
local config = {
	GamePass = {
		priceRequiredForSale = true,
		regionalPricing = true,
		editableName = true,
		editablePrice = true
	},
	Subscription = {
		priceRequiredForSale = false,
		regionalPricing = false,
		editableName = false,
		editablePrice = false
	}
}

return function(p1)
	-- upvalues: config (copy)
	return if p1 == nil then nil else config[p1]
end