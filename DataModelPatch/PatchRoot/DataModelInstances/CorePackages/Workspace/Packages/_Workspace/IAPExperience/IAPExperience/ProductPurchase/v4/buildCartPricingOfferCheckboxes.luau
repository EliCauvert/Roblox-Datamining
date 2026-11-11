local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local Checkbox = require(Parent.Foundation).Checkbox
local _ = require(script.Parent.useCartPricing)

return function(p1)
	-- upvalues: ReactModule (copy), Checkbox (copy)
	local CartPricing = p1.cartPricing
	local Elements = {}
	
	if not CartPricing.showCartOfferUi then
		return Elements
	end
	for LayoutOrder, cartPricingOffer in CartPricing.cartPricingOffers do
		local OfferId = cartPricingOffer.offerId
		Elements["CartPricingOffer_" .. OfferId] = ReactModule.createElement(Checkbox, {
			size = "XSmall",
			LayoutOrder = LayoutOrder,
			label = cartPricingOffer.localizedDescription,
			isChecked = cartPricingOffer.selected,
			isDisabled = p1.isDisabled,
			onActivated = function()
				-- upvalues: CartPricing (copy), OfferId (copy)
				CartPricing.toggleCartPricingOffer(OfferId)
			end
		})
	end
	return Elements
end