local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local checkbox = require(parent.Foundation).Checkbox
local fFlagEnableInExperienceOffersPurchaseFlow = require(parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow
local var1 = if fFlagEnableInExperienceOffersPurchaseFlow then require(script.Parent.OfferCheckboxRow) else nil
local _ = require(script.Parent.useCartPricing)

return function(p1)
	-- upvalues: fFlagEnableInExperienceOffersPurchaseFlow (ref), reactModule (ref), var1 (ref), checkbox (ref)
	local cartPricing = p1.cartPricing
	local t = {}
	
	if not cartPricing.showCartOfferUi then
		return t
	end
	for i, v in cartPricing.cartPricingOffers do
		local offerId = v.offerId
		
		if fFlagEnableInExperienceOffersPurchaseFlow then
			t["CartPricingOffer_" .. offerId] = reactModule.createElement(var1, {
				LayoutOrder = i,
				label = v.localizedDescription,
				isChecked = v.selected,
				isDisabled = p1.isDisabled,
				expirationTimeUtc = v.expirationTimeUtc,
				onActivated = function()
					-- upvalues: cartPricing (ref), offerId (ref)
					cartPricing.toggleCartPricingOffer(offerId)
				end
			})
		else
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
	end
	return t
end