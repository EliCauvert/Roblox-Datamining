local cartPricingResponseLineItemModule = require(script.Parent.cartPricingResponseLineItem)
local _ = require(script.Parent.Parent.PricingTypes)

return function(p0) --[[ line: 38 | named "deriveCartPricingView" ]]
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
	
	for i, v in items do
		local i_1 = cartPricingResponseLineItemModule.getCartLineSalePriceInRobux(v)
		
		if i_1 ~= nil then
			var1 += i_1
			var2 += cartPricingResponseLineItemModule.getCartLineRegularPriceInRobux(v, i_1)
			continue
		end
		return nil
	end
	if var1 <= 0 then
		return nil
	end
	local var3 = cartPricingResponseLineItemModule.extractCartPricingMarketingOffers(p0)
	local t = {}
	
	for i_1, v_1 in var3 do
		if v_1.selected then
			table.insert(t, v_1.offerId)
		end
	end
	return {
		priceAfterDiscount = var1,
		originalPrice = var2,
		hasSavings = var1 < var2,
		itemCount = #items,
		discounts = cartPricingResponseLineItemModule.extractDiscountRowsFromLineItems(items),
		offers = var3,
		selectedOfferIds = t,
		savingsSummary = cartPricingResponseLineItemModule.extractCartPricingSavingsSummary(p0)
	}
end