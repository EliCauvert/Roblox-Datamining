local _ = require(script.Parent.MarketplaceOffersBannerTypes)

return {
	getMarketplaceOffersBannerOfferDisplayTitle = function(p0) --[[ line: 6 ]]
		return p0.localizedText
	end,
	getMarketplaceOffersBannerOfferDisplayId = function(p1) --[[ line: 10 ]]
		return p1.offerId
	end,
	marketplaceOffersBannerPayloadHasRenderableOffer = function(p2) --[[ line: 14 ]]
		for i, v in p2.offers do
			if v.localizedText ~= nil then
				return true
			end
		end
		return false
	end
}