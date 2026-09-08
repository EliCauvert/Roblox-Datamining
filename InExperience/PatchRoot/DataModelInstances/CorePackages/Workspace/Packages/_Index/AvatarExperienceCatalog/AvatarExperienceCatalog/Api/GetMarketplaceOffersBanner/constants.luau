local AXUpdateOffersBannerFeatureKey = game:DefineFastFlag("AXUpdateOffersBannerFeatureKey", false)

return {
	FETCH_MARKETPLACE_OFFERS_BANNER_LATENCY_COUNTER_NAME = "NetworkFetchMarketplaceOffersBannerLatency",
	FETCH_MARKETPLACE_OFFERS_BANNER_MODEL_MISMATCH_COUNTER_NAME = "NetworkFetchMarketplaceOffersBannerModelMismatch",
	OFFERS_V1_RELATIVE_PATH = "marketplace-sales/v1/offers",
	OFFERS_FOR_USER_FEATURE_KEY_FEED = if AXUpdateOffersBannerFeatureKey then "MARKETPLACE_FEED" else "marketplace-feed",
	OFFERS_FOR_USER_FEATURE_KEY_CART = if AXUpdateOffersBannerFeatureKey then "MARKETPLACE_CART" else "marketplace-cart"
}