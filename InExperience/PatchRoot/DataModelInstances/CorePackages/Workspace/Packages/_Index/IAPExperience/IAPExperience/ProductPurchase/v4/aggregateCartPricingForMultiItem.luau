local CartPricingResponseLineItemModule = require(script.Parent.cartPricingResponseLineItem)

return function(p1) --[[ Line: 20 | Named "aggregateCartPricingForMultiItem" ]]
	-- upvalues: CartPricingResponseLineItemModule (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local Errors = p1.errors
	
	if type(Errors) == "table" and next(Errors) ~= nil then
		return nil
	end
	local Items = p1.items
	
	if type(Items) ~= "table" or next(Items) == nil then
		return nil
	end
	local NewCartLineRegularPriceInRobux = 0
	local TotalRobux = 0
	
	for _, item in ipairs(Items) do
		local CartLineSalePriceInRobux: number = CartPricingResponseLineItemModule.getCartLineSalePriceInRobux(item)
		
		if CartLineSalePriceInRobux == nil then
			return nil
		end
		NewCartLineRegularPriceInRobux += CartPricingResponseLineItemModule.getCartLineRegularPriceInRobux(item, CartLineSalePriceInRobux)
		TotalRobux += CartLineSalePriceInRobux
	end
	local NewCartLineRegularPriceInRobuxDelta = NewCartLineRegularPriceInRobux - TotalRobux
	
	return if NewCartLineRegularPriceInRobuxDelta <= 0 then nil else {
		subtotalRobux = NewCartLineRegularPriceInRobux,
		totalRobux = TotalRobux,
		savingsRobux = NewCartLineRegularPriceInRobuxDelta,
		itemCount = #Items
	}
end