local _ = require(script.Parent.Common.DirectRecommendationTypes)

return {
	installReducer = require(script.Parent.installReducer),
	PYMKCollectionCarousel = require(script.Parent.Components.PYMKCollectionCarousel),
	PYMKCarouselEntryPoint = require(script.Parent.Components.PYMKCarouselEntryPoint),
	RoduxKey = require(script.Parent.Common.Constants).RODUX_KEY,
	PYMKCarouselModel = {
		fromJsonData = require(script.Parent.installReducer.fromOmniJsonData)
	},
	["jest.config"] = script.Parent["jest.config"]
}