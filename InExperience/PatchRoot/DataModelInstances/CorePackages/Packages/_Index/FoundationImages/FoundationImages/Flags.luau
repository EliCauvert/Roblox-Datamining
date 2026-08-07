local safeFlagsModule = require(script:FindFirstAncestor("FoundationImages").Parent.SafeFlags)

return {
	FixBlurryImages = safeFlagsModule.createGetFFlag("FixBlurryImages")(),
	FoundationImagesWhitelistedIconAssets = safeFlagsModule.createGetFString("FoundationImagesWhitelistedIconAssets", "")()
}