local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local Checkbox = require(Parent.Foundation).Checkbox
local FFlagEnableInExperienceOffersPurchaseFlow = require(Parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow
local OfferCheckboxRowModule = if FFlagEnableInExperienceOffersPurchaseFlow then require(script.Parent.OfferCheckboxRow) else nil
local _ = require(script.Parent.useCartPricing)

return function(p1) --[[ Line: 24 | Named "buildCartPricingOfferCheckboxes" ]]
	-- upvalues: FFlagEnableInExperienceOffersPurchaseFlow (copy), ReactModule (copy), OfferCheckboxRowModule (copy), Checkbox (copy)
	local CartPricing = p1.cartPricing
	local Elements = {}
	
	if not CartPricing.showCartOfferUi then
		return Elements
	end
	for LayoutOrder, cartPricingOffer in CartPricing.cartPricingOffers do
		local OfferId = cartPricingOffer.offerId
		
		if FFlagEnableInExperienceOffersPurchaseFlow then
			Elements["CartPricingOffer_" .. OfferId] = ReactModule.createElement(OfferCheckboxRowModule, {
				LayoutOrder = LayoutOrder,
				label = cartPricingOffer.localizedDescription,
				isChecked = cartPricingOffer.selected,
				isDisabled = p1.isDisabled,
				expirationTimeUtc = cartPricingOffer.expirationTimeUtc,
				onActivated = function() --[[ Line: 41 ]]
					-- upvalues: CartPricing (copy), OfferId (copy)
					CartPricing.toggleCartPricingOffer(OfferId)
				end
			})
		else
			Elements["CartPricingOffer_" .. OfferId] = ReactModule.createElement(Checkbox, {
				size = "XSmall",
				LayoutOrder = LayoutOrder,
				label = cartPricingOffer.localizedDescription,
				isChecked = cartPricingOffer.selected,
				isDisabled = p1.isDisabled,
				onActivated = function() --[[ Line: 52 ]]
					-- upvalues: CartPricing (copy), OfferId (copy)
					CartPricing.toggleCartPricingOffer(OfferId)
				end
			})
		end
	end
	return Elements
end