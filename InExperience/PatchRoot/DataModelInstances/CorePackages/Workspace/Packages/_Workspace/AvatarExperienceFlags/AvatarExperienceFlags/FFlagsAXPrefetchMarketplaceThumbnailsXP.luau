local fFlagAXStrictCheckForPrefetchMarketplaceModule = require(script.Parent.FFlagAXStrictCheckForPrefetchMarketplace)

return {
	UserIsInTreatment = fFlagAXStrictCheckForPrefetchMarketplaceModule and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXPV4", false),
	UserIsInExperiment = fFlagAXStrictCheckForPrefetchMarketplaceModule and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXPExposureV4", false)
}