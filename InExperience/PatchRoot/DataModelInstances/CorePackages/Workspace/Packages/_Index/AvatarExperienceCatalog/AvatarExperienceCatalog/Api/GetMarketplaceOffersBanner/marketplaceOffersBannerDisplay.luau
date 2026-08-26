local _ = require(script.Parent.MarketplaceOffersBannerTypes)

return {
	getMarketplaceOffersBannerOfferDisplayTitle = function(p1)
		return p1.localizedText
	end,
	getMarketplaceOffersBannerOfferDisplayId = function(p1)
		return p1.offerId
	end,
	marketplaceOffersBannerPayloadHasRenderableOffer = function(p1)
		for i, v in p1.offers do
			if v.localizedText ~= nil then
				return true
			end
		end
		return false
	end
}