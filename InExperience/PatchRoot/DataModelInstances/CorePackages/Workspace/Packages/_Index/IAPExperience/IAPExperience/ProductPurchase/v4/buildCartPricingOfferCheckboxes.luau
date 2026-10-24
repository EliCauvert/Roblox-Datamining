local ReactModule = require(script.Parent.Parent.Parent.Parent.React)
local OfferCheckboxRowModule = require(script.Parent.OfferCheckboxRow)
local _ = require(script.Parent.useCartPricing)

return function(p1)
	-- upvalues: ReactModule (copy), OfferCheckboxRowModule (copy)
	local CartPricing = p1.cartPricing
	local Elements = {}
	
	if not CartPricing.showCartOfferUi then
		return Elements
	end
	for LayoutOrder, cartPricingOffer in CartPricing.cartPricingOffers do
		local OfferId = cartPricingOffer.offerId
		Elements["CartPricingOffer_" .. OfferId] = ReactModule.createElement(OfferCheckboxRowModule, {
			LayoutOrder = LayoutOrder,
			label = cartPricingOffer.localizedDescription,
			isChecked = cartPricingOffer.selected,
			isDisabled = p1.isDisabled,
			expirationTimeUtc = cartPricingOffer.expirationTimeUtc,
			onActivated = function()
				-- upvalues: CartPricing (copy), OfferId (copy)
				CartPricing.toggleCartPricingOffer(OfferId)
			end
		})
	end
	return Elements
end