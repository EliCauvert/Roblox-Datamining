local safeFlagsModule = require(script:FindFirstAncestor("FoundationImages").Parent.SafeFlags)

return {
	FoundationImagesWhitelistedIconAssets = safeFlagsModule.createGetFString("FoundationImagesWhitelistedIconAssets", "")(),
	FoundationImagesStaticPath = safeFlagsModule.createGetFFlag("FoundationImagesStaticPath")()
}