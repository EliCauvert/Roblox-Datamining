local SafeFlagsModule = require(script:FindFirstAncestor("FoundationImages").Parent.SafeFlags)

return {
	FoundationImagesWhitelistedIconAssets = SafeFlagsModule.createGetFString("FoundationImagesWhitelistedIconAssets", "")(),
	FoundationImagesStaticPath = SafeFlagsModule.createGetFFlag("FoundationImagesStaticPath")()
}