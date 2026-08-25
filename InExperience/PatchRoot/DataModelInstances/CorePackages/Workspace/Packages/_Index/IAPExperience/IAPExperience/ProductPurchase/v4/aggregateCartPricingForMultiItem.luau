local cartPricingResponseLineItemModule = require(script.Parent.cartPricingResponseLineItem)

return function(p0)
	-- upvalues: cartPricingResponseLineItemModule (ref)
	if type(p0) ~= "table" then
		return nil
	end
	local errors = p0.errors
	
	if type(errors) == "table" and next(errors) ~= nil then
		return nil
	end
	local items = p0.items
	
	if type(items) ~= "table" or next(items) == nil then
		return nil
	end
	local var1 = 0
	local var2 = 0
	
	for i, v in ipairs(items) do
		local cartLineSalePriceInRobux = cartPricingResponseLineItemModule.getCartLineSalePriceInRobux(v)
		
		if cartLineSalePriceInRobux ~= nil then
			var1 += cartPricingResponseLineItemModule.getCartLineRegularPriceInRobux(v, cartLineSalePriceInRobux)
			var2 += cartLineSalePriceInRobux
			continue
		end
		return nil
	end
	local var3 = var1 - var2
	
	return if var3 <= 0 then nil else {
		subtotalRobux = var1,
		totalRobux = var2,
		savingsRobux = var3,
		itemCount = #items
	}
end