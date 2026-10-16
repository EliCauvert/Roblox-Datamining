local FFlagAXStrictCheckForPrefetchMarketplaceModule = require(script.Parent.FFlagAXStrictCheckForPrefetchMarketplace)

return {
	UserIsInTreatment = FFlagAXStrictCheckForPrefetchMarketplaceModule and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXPV4", false),
	UserIsInExperiment = FFlagAXStrictCheckForPrefetchMarketplaceModule and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXPExposureV4", false)
}