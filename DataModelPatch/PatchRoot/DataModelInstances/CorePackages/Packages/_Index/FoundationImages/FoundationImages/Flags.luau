local SafeFlagsModule = require(script:FindFirstAncestor("FoundationImages").Parent.SafeFlags)

return {
	FixBlurryImages = SafeFlagsModule.createGetFFlag("FixBlurryImages")(),
	FoundationImagesWhitelistedIconAssets = SafeFlagsModule.createGetFString("FoundationImagesWhitelistedIconAssets", "")()
}