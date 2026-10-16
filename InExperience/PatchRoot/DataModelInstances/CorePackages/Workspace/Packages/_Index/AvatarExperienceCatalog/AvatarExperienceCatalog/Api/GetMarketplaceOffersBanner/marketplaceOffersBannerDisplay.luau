local _ = require(script.Parent.MarketplaceOffersBannerTypes)

return {
	getMarketplaceOffersBannerOfferDisplayTitle = function(p1) --[[ Line: 6 ]]
		return p1.localizedText
	end,
	getMarketplaceOffersBannerOfferDisplayId = function(p1) --[[ Line: 10 ]]
		return p1.offerId
	end,
	marketplaceOffersBannerPayloadHasRenderableOffer = function(p1): boolean --[[ Line: 14 ]]
		for _, offer in p1.offers do
			if offer.localizedText ~= nil then
				return true
			end
		end
		return false
	end
}