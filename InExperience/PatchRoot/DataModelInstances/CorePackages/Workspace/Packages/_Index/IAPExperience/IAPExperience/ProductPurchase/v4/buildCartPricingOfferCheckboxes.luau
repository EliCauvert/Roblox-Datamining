local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local checkbox = require(parent.Foundation).Checkbox
local _ = require(script.Parent.useCartPricing)

return function(p1)
	-- upvalues: reactModule (ref), checkbox (ref)
	local cartPricing = p1.cartPricing
	local t = {}
	
	if not cartPricing.showCartOfferUi then
		return t
	end
	for i, v in cartPricing.cartPricingOffers do
		local offerId = v.offerId
		t["CartPricingOffer_" .. offerId] = reactModule.createElement(checkbox, {
			size = "XSmall",
			LayoutOrder = i,
			label = v.localizedDescription,
			isChecked = v.selected,
			isDisabled = p1.isDisabled,
			onActivated = function()
				-- upvalues: cartPricing (ref), offerId (ref)
				cartPricing.toggleCartPricingOffer(offerId)
			end
		})
	end
	return t
end